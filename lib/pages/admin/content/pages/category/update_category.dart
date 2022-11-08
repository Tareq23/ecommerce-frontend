import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
// import 'dart:html' as html;

class UpdateCategory extends StatefulWidget {
  String? name;
  String? imageUrl;
  UpdateCategory({Key? key}) : super(key: key);

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
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
      var url = GoRouter.of(context).location.split("/");
      int id = int.parse(url.elementAt(url.length - 1));
      categoryController.isFetchCategoryById.value = true;
      await categoryController.fetchCategoryById(id);
      textEditingController.text = categoryController.selectedCategory.value.name!;
      setState(() {
        _check = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      // categoryController.isLoadImage.value = true;
      setState(() {
        webImage = f;
        // print('web image : $f');
        pickedImage = File('a');
        _isImageChanged = true;
        print('update category picked image method is image changed : $_isImageChanged');
      });
    }
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
            width: overallController.adminMainContentWidth.value - 18,
            height: 100,
            decoration: BoxDecoration(color: Colors.yellow),
          ),
          SizedBox(
            width: overallController.adminMainContentWidth.value * 0.7,
            height: overallController.adminMainContentHeight.value - 100,
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
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (overallController
                                          .adminMainContentWidth.value *
                                      0.7) *
                                  0.4,
                              height: 300,
                              padding: const EdgeInsets.all(12),
                              child: Image.network(
                                categoryController
                                    .selectedCategory.value.imageUrl
                                    .toString(),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                                errorBuilder: (context, object, stacktrace) {
                                  _isImageExists = false;
                                  print('image is exists : $_isImageExists');
                                  return Image.asset(
                                    'assets/images/no_image_available.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: (overallController
                                          .adminMainContentWidth.value *
                                      0.7) *
                                  0.4,
                              height: 300,
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: TEXT_WHITE,
                                border: Border.all(
                                  color: (_isImageExists == false && _isImageChanged == false) ?  TEXT_RED : Colors.transparent,
                                  width: 1.2
                                )
                              ),
                              child: Stack(
                                children: [
                                  if (pickedImage != null)
                                    Container(
                                      width: double.infinity,
                                      height: 300,
                                      padding: const EdgeInsets.all(4),
                                      child: pickedImage != null
                                          ? Image.memory(
                                              webImage!,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill,
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: const EdgeInsets.all(0),
                                    color: TEXT_DARK.withOpacity(0.2),
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        _pickImage();
                                      },
                                      child: CustomText(
                                        text: 'Choose Image',
                                        color: !categoryController
                                                .missingImage.value
                                            ? TEXT_WHITE
                                            : TEXT_RED,
                                        size: 18,
                                        weight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Obx(() {
                            if (categoryController.updateCategoryAction.value) {
                              return circularProgressIndicator();
                            }
                            return InkWell(
                              onTap: () async {
                                // if (!categoryController.isLoadImage.value) {
                                //   categoryController.missingImage.value = true;
                                //   _formKey.currentState!.validate();
                                //   return;
                                // }
                                print('update field validation _isImageChanged : $_isImageChanged , _isImageExists : $_isImageExists');
                                if(_isImageChanged == false && _isImageExists == false){
                                  categoryController.missingImage.value = true;
                                  return ;
                                }
                                if(!_formKey.currentState!.validate()){
                                  return;
                                }

                                print('update field validation : ----------> ');

                                categoryController.missingImage.value = false;
                                categoryController.updateCategoryAction.value =
                                    true;
                                await categoryController.updateCategory(
                                    id: categoryController
                                        .selectedCategory.value.id!,
                                    image: webImage!,
                                    name: textEditingController.text.trim(),
                                    isImageExists: _isImageExists,
                                    isImageChanged: _isImageChanged);
                                textEditingController.text = '';
                                setState(() {
                                  pickedImage = null;
                                });
                                // categoryController.isLoadImage.value = false;
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
