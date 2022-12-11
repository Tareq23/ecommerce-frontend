import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/brand_model.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/widgets/admin_content_page_upper_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/html_text_editor_widget.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class UpdateProduct extends StatefulWidget {
  String? name;
  String? imageUrl;
  UpdateProduct({Key? key}) : super(key: key);

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {


  final productNameController = TextEditingController();
  final productRegularPriceController = TextEditingController();
  final productDiscountPriceController = TextEditingController();
  final productQuantityController = TextEditingController();
  Uint8List? webImage;
  List<int>? selectedFile;
  File? pickedImage;
  final _formKey = GlobalKey<FormState>();
  final HtmlEditorController productDescController = HtmlEditorController();
  bool _isImageExists = false;
  bool _isImageChanged = false;

  bool checkProduct = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if(!checkProduct){
      await categoryController.fetchCategory();
      await brandController.fetchAllBrand();
      var url = GoRouter.of(context).location.split("/");
      int id = int.parse(url.elementAt(url.length - 1)) ?? 0;
      print('--------------------> product Details : id : $id');
      if(id == 0){
        // Page Not Found
      }
      await productController.fetchProductById(id);
      productNameController.text = productController.selectProduct.value.name.toString();
      productRegularPriceController.text = productController.selectProduct.value.regularPrice.toString();
      productDiscountPriceController.text = productController.selectProduct.value.discountPrice.toString();
      productQuantityController.text = productController.selectProduct.value.quantity.toString();
      setState((){
        checkProduct=true;
      });

    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productRegularPriceController.dispose();
    productDiscountPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      productController.isLoadImage.value = true;
      _isImageChanged = true;
      setState(() {
        webImage = f;
        // print('web image : $f');
        pickedImage = File('a');
      });
    }
  }

  Widget _selectCategory(BuildContext context){
    return SizedBox(
      child: Obx((){
        return DropdownButton(
          alignment: Alignment.centerLeft,
          value: categoryController.selectedCategory.value,
          icon: const SizedBox.shrink(),
          isDense:true,
          underline: const SizedBox.shrink(),
          borderRadius: BorderRadius.circular(12),
          items: categoryController.categoryList
              .map(
                (e) => DropdownMenuItem<HomeCategoryModel>(
              value: e,
              child: CustomText(
                text: e.name.toString(),
              ),
            ),
          )
              .toList(),
          onChanged: (newValue) {
            categoryController.selectedCategory.value = newValue!;
            // print('selected category : ${categoryController.selectedCategory.value.id}');
          },
        );
      })
    );
  }
  Widget _selectBrand(BuildContext context){
    return SizedBox(
      child: Obx((){
        return DropdownButton(
          alignment: Alignment.centerLeft,
          value: brandController.selectedBrand.value,
          icon: const SizedBox.shrink(),
          isDense:true,
          underline: const SizedBox.shrink(),
          borderRadius: BorderRadius.circular(12),
          items: brandController.brandList
              .map(
                (e) => DropdownMenuItem<BrandModel>(
              value: e,
              child: CustomText(
                text: e.name.toString(),
              ),
            ),
          )
              .toList(),
          onChanged: (newValue) {
            brandController.selectedBrand.value = newValue!;
            // print('selected category : ${categoryController.selectedCategory.value.id}');
          },
        );
      })
    );
  }

  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load(path);
  //
  //   final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   print(file);
  //   return file;
  // }


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
            height: overallController.adminMainContentHeight.value,
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      AdminPageContentUpperWidget(pageTitle: 'Product Update',onTap: (){},linkTitle: 'All Product',),
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
                      // select product category
                      const CustomText(text: 'Category : ',size: 16,weight: FontWeight.w500,),
                      const SizedBox(height: 10,),
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
                        child: checkProduct ?  _selectCategory(context) : const CustomText(text: 'Category Missing',size: 16,weight: FontWeight.w600,),
                      ),
                      // select product category error
                      Obx((){
                        if(categoryController.selectedCategory.value.id == null && !productController.isSelectCategory.value) {
                          return const CustomText(text: 'Category Missing',color: TEXT_RED,size: 16,weight: FontWeight.w500,);
                        }
                        return const SizedBox.shrink();
                      }),

                      const SizedBox(height: 20,),
                      // select product brand
                      const CustomText(text: 'Brand : ',size: 16,weight: FontWeight.w500,),
                      const SizedBox(height: 10,),
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
                        child: checkProduct ?  _selectBrand(context) : const CustomText(text: 'Brand Missing',size: 16,weight: FontWeight.w600,),
                      ),
                      // select product brand error
                      Obx((){
                        if(brandController.selectedBrand.value.id == null && !productController.isSelectCategory.value) {
                          return const CustomText(text: 'Brand Missing',color: TEXT_RED,size: 16,weight: FontWeight.w500,);
                        }
                        return const SizedBox.shrink();
                      }),


                      const SizedBox(height: 20,),
                      // product discount price
                      TextFieldWidget(
                        controller: productQuantityController,
                        hint: 'Quantity',
                        validator: (value) {
                          return textFieldValidation(
                              title: 'Product quantity',
                              value: value!,
                              min: 5,
                              max: 50,
                              isNumber: true);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      // product Regular Price
                      TextFieldWidget(
                        controller: productRegularPriceController,
                        hint: 'Regular Price',
                        validator: (value) {
                          return textFieldValidation(
                              title: 'Regular Price',
                              value: value!,
                              isNumber: true);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),



                      // product discount price
                      TextFieldWidget(
                        controller: productDiscountPriceController,
                        hint: 'Discount Price',
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
                                productController.selectProduct.value.imageUrl
                                    .toString(),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                                loadingBuilder:(context, child, loadingProgress) {
                                  if(loadingProgress == null){
                                    print('loadingProgress null-------------------> $loadingProgress');
                                    return child;
                                  }
                                  if(loadingProgress != null && _isImageExists == false){
                                    _isImageExists = !_isImageExists;
                                    print('image is exists -->: $_isImageExists');
                                  }
                                  // print('loadingProgress -------------------> $loadingProgress');
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ?
                                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, object, stacktrace) {

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
                                        color: !productController
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
                                  if(!_isImageChanged && !_isImageExists){
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
                                if(!_isImageChanged && !_isImageExists){
                                  productController.missingImage.value = true;
                                  print('check update product image : _isImageChanged ->>>>>>>> $_isImageChanged');
                                  print('check update product image : _isImageExists ->>>>>>>> $_isImageExists');
                                  // print('check----------------> !_isImageChanged && !_isImageExists : ${!_isImageChanged && !_isImageExists}');
                                  productController.uploadProductAction.value = false;
                                  return;
                                }
                                if(productController.selectProduct.value.description!.trim().length<20){
                                  productController.uploadProductAction.value = false;
                                  return ;
                                }

                                productController.selectProduct.value.name =
                                    productNameController.text.trim();
                                productController.selectProduct.value.regularPrice =
                                    double.parse(productRegularPriceController.text.trim());
                                productController.selectProduct.value.quantity = int.parse(productQuantityController.text.trim());
                                productController.selectProduct.value.discountPrice = double.parse(productDiscountPriceController.text.trim());
                                // if(!_isImageChanged){
                                //   File image = await getImageFileFromAssets('images/no_image_available.png');
                                //   var f = await image.readAsBytes();
                                //   setState(() {
                                //     webImage = f;
                                //     // print('web image : $f');
                                //     pickedImage = File('a');
                                //   });
                                // }
                                if(_isImageChanged){
                                  print('------> productController.updateProduct(image: webImage!,isImageChanged: _isImageChanged,isImageExists: _isImage');
                                  await productController.updateProduct(image: webImage!,isImageChanged: _isImageChanged,isImageExists: _isImageExists);
                                }
                                else{
                                  print('------> productController.updateProductWithoutImage(isImageExists: _isImageExists);');
                                  await productController.updateProductWithoutImage(isImageExists: _isImageExists);
                                }
                                setState(() {
                                  pickedImage = null;
                                });
                                productRegularPriceController.text = '';
                                productDiscountPriceController.text = '';
                                productNameController.text = '';
                                // productController.selectProduct.value = ProductModel.empty();
                                // categoryController.selectedCategory.value = CategoryModel.empty();
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
                                  text: 'Update',
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
