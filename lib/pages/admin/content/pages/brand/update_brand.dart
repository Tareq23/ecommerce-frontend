import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/admin_content_page_upper_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class BrandUpdate extends StatefulWidget {
  String? name;
  String? imageUrl;
  BrandUpdate({Key? key}) : super(key: key);

  @override
  State<BrandUpdate> createState() => _BrandUpdateState();
}

class _BrandUpdateState extends State<BrandUpdate> {
  final textEditingController = TextEditingController(
      text: categoryController.selectedCategory.value.name);
  Uint8List? webImage;
  List<int>? selectedFile;
  File? pickedImage;
  bool _check = false;
  bool _isImageExists = true;
  bool _isImageChanged = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController.addListener(() {
      categoryController.selectedCategory.value.name =
          textEditingController.text.trim();
    });
  }

  @override
  void didChangeDependencies() async{
    if (!_check) {
      textEditingController.text='brand name';
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: Color(0xffe8e8e8),
      ),
      width: overallController.adminMainContentWidth.value,
      height: overallController.adminMainContentHeight.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: overallController.adminMainContentWidth.value,
            height: overallController.adminMainContentHeight.value ,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ScrollConfiguration(
              behavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      AdminPageContentUpperWidget(pageTitle: 'Brand Update',onTap: (){
                        context.goNamed(adminBrandViewAll);
                      },linkTitle: 'All Brand',),
                      const SizedBox(
                        height: 10,
                      ),
                      // Obx((){
                      //   if(categoryController.selectedCategory.value.name!.isEmpty){
                      //   return const CircularProgressIndicator(color: TEXT_DARK,);
                      //   }
                      //   textEditingController.text = categoryController.selectedCategory.value.name!;
                      //   return TextFieldWidget(
                      //     controller: textEditingController,
                      //     hint: 'Name',
                      //     validator: (value) {
                      //       return textFieldValidation(
                      //           title: 'Category name',
                      //           value: value!,
                      //           min: 5,
                      //           max: 50);
                      //     },
                      //   );
                      // }),
                      TextFieldWidget(
                        controller: textEditingController,
                        hint: 'Name',
                        validator: (value) {
                          return textFieldValidation(
                              title: 'Category name',
                              value: value!,
                              min: 5,
                              max: 50);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Obx(() {
                            if (brandController.updateActionButton.value) {
                              return circularProgressIndicator();
                            }
                            return InkWell(
                              onTap: () async {
                                if(_formKey.currentState!.validate()){
                                  brandController.updateActionButton.value = true;


                                  // here call api

                                  brandController.updateActionButton.value = false;
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                margin: const EdgeInsets.only(top: 35),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: BG_BUTTON,
                                ),
                                child: const CustomText(
                                  text: 'Update',
                                  color: TEXT_WHITE,
                                  size: 16,
                                  weight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
