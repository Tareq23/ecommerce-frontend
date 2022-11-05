import 'dart:convert';
import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'dart:html' as html;

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final textEditingController = TextEditingController();
  Uint8List? webImage;
  List<int>? selectedFile;
  File? pickedImage;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController.addListener(() {
      // textEditingController.text = textEditingController.text.trim();
    });
    super.initState();
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      categoryController.isLoadImage.value = true;
      setState(() {
        webImage = f;
        print('web image : $f');
        pickedImage = File('a');
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
                      TextFieldWidget(
                        controller: textEditingController,
                        hint: 'Name',
                        validator: (value){
                          return textFieldValidation(title: 'Category name',value: value!,min: 5,max: 50);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (pickedImage != null)
                        Container(
                          width: double.infinity,
                          height: 300,
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 0.8,
                              color: TEXT_DARK.withOpacity(0.6),
                            ),
                          ),
                          child: pickedImage != null
                              ? Image.memory(
                                  webImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                )
                              : SizedBox.shrink(),
                        ),
                      Obx((){
                        return Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 0.8,
                              color: !categoryController.missingImage.value ? TEXT_DARK.withOpacity(0.6) : TEXT_RED.withOpacity(0.8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text:  'Select Category Image',
                                size: 16,
                                weight: FontWeight.w600,
                                color: !categoryController.missingImage.value ?  TEXT_DARK : TEXT_RED,
                              ),
                              IconButton(
                                onPressed: () async {
                                  // await overallController.pickFile();
                                  _pickImage();
                                },
                                icon: const Icon(
                                  Icons.image,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx((){
                          if(categoryController.uploadCategoryAction.value){
                            return circularProgressIndicator();
                          }
                          return InkWell(
                            onTap: () async{
                              if(!categoryController.isLoadImage.value){
                                categoryController.missingImage.value = true;
                                _formKey.currentState!.validate();
                                return ;
                              }
                              if(!_formKey.currentState!.validate()) return ;


                              categoryController.missingImage.value = false;
                              categoryController.uploadCategoryAction.value = true;
                              await categoryController.addCategory(image: webImage,name:textEditingController.text.trim());
                              textEditingController.text='';
                              setState(() {
                                pickedImage = null;
                              });
                              categoryController.isLoadImage.value=false;
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              margin: const EdgeInsets.only(top: 35),
                              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: BG_BUTTON,
                              ),
                              child: const CustomText(text: 'Upload',color: TEXT_WHITE,size: 16,weight: FontWeight.w500,letterSpacing: 1.2,),
                            ),
                          );
                        })
                      ),
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
