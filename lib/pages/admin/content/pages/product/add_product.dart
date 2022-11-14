import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/html_text_editor_widget.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  Uint8List? webImage;
  List<int>? selectedFile;
  File? pickedImage;
  final _formKey = GlobalKey<FormState>();
  final HtmlEditorController productDescController = HtmlEditorController();

  bool checkCategory = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!checkCategory){
      categoryController.selectedCategory.value = CategoryModel.empty();
      productController.selectProduct.value = ProductModel.empty();
      categoryController.fetchCategory();
      setState(() {
        checkCategory=true;
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      productController.isLoadImage.value = true;
      setState(() {
        webImage = f;
        // print('web image : $f');
        pickedImage = File('a');
      });
    }
  }

  DropdownButton _selectCategory(BuildContext context){
    return DropdownButton(
      alignment: Alignment.centerLeft,
      value: null,
      icon: const SizedBox.shrink(),
      isDense:true,
      underline: const SizedBox.shrink(),
      borderRadius: BorderRadius.circular(12),

      hint: Obx((){
        if(categoryController.selectedCategory.value.name != null){
          return CustomText(text: categoryController.selectedCategory.value.name.toString(),textAlign: TextAlign.start,);
        }
        return const CustomText(text: 'Select Category',textAlign: TextAlign.start,);
      }),
      items: categoryController.categoryList
          .map(
            (e) => DropdownMenuItem<CategoryModel>(
          value: e,
          child: CustomText(
            text: e.name.toString(),
          ),
        ),
      )
          .toList(),
      onChanged: (newValue) {
        // print("----------> $newValue\n---------------> $_selectedValue");
        // setState(() {
        //   _selectedValue = newValue!;
        // });
        categoryController.selectedCategory.value = newValue;
      },
    );
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      // product name
                      TextFieldWidget(
                        controller: productNameController,
                        hint: 'Product Name',
                        validator: (value) {
                          return textFieldValidation(
                            title: 'Product name',
                            value: value!,
                            min: 5,
                            max: 50,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // product price
                      TextFieldWidget(
                        controller: productPriceController,
                        hint: 'Product Price',
                        validator: (value) {
                          return textFieldValidation(
                              title: 'Product Price',
                              value: value!,
                              min: 5,
                              max: 50,
                              isNumber: true);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                          Border.all(width: 1.2, color: !productController.isSelectCategory.value ? TEXT_RED.withOpacity(0.8) : TEXT_FIELD_BORDER),
                        ),
                        alignment: Alignment.centerLeft,
                        child: _selectCategory(context),
                      ),
                      // select product category
                      Obx((){
                        if(categoryController.selectedCategory.value.id == null && !productController.isSelectCategory.value) {
                          return const CustomText(text: 'Category Missing',color: TEXT_RED,size: 16,weight: FontWeight.w500,);
                        }
                        return SizedBox.shrink();
                      }),

                      const SizedBox(
                        height: 20,
                      ),

                      // product description
                      Container(

                        height: overallController.screenHeight.value * 0.3,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(width: 1.2, color: TEXT_FIELD_BORDER),
                        ),
                        child: HtmlTextEditorWidget(
                          controller: productDescController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (pickedImage != null)
                        Container(
                          width: 400,
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
                              : const SizedBox.shrink(),
                        ),
                      Obx(() {
                        return Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 0.8,
                              color: !categoryController.missingImage.value
                                  ? TEXT_DARK.withOpacity(0.6)
                                  : TEXT_RED.withOpacity(0.8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Select Product Image',
                                size: 16,
                                weight: FontWeight.w600,
                                color: !categoryController.missingImage.value
                                    ? TEXT_DARK
                                    : TEXT_RED,
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
                        child: Obx(
                          () {
                            if (productController.uploadProductAction.value) {
                              return circularProgressIndicator();
                            }
                            return InkWell(
                              onTap: () async {


                                productController.uploadProductAction.value=true;

                                _formKey.currentState!.save();
                                if(!_formKey.currentState!.validate()){

                                  if(categoryController.selectedCategory.value.id == null){
                                       productController.isSelectCategory.value = false;
                                  }
                                  if(!productController.isLoadImage.value){
                                    productController.missingImage.value = true;
                                  }
                                  productController.uploadProductAction.value = false;
                                  return;
                                }
                                // print('product : category : ${categoryController.selectedCategory.value.id}');
                                // print('product : name : ${productNameController.text}');
                                // print('product : name : ${productPriceController.text}');


                                if(categoryController.selectedCategory.value.id == null){
                                  productController.uploadProductAction.value = false;
                                  return;
                                }
                                if(!productController.isLoadImage.value){
                                  productController.uploadProductAction.value = false;
                                  return;
                                }
                                if(productController.selectProduct.value.description!.trim().length<20){
                                  productController.uploadProductAction.value = false;
                                  return ;
                                }

                                productController.selectProduct.value.name =
                                    productNameController.text.trim();
                                productController.selectProduct.value.price =
                                    productPriceController.text.trim();
                                await productController.addProduct(image: webImage);
                                setState(() {
                                  pickedImage = null;
                                });
                                productPriceController.text = '';
                                productNameController.text = '';
                                productController.selectProduct.value = ProductModel.empty();
                                categoryController.selectedCategory.value = CategoryModel.empty();
                                productController.missingImage.value=false;
                                productController.uploadProductAction.value = false;

                                if(!mounted) return;
                                context.go('/admin/dashboard/product');
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
                                  text: 'Save',
                                  color: TEXT_WHITE,
                                  size: 16,
                                  weight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            );
                          },
                        ),
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
