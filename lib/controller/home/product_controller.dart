

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
import 'package:ecommercefrontend/services/api/product_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
{

  static ProductController instance = Get.find();



  var selectProduct = HomeProductModel.empty().obs;



  var productListSerial = 0.obs;
  var productList = <HomeProductModel>[].obs;


  var isLoadImage = false.obs;
  var isFetchProductById = false.obs;
  var missingImage = false.obs;
  var uploadProductAction = false.obs;
  var updateProductAction = false.obs;
  var isSelectCategory = true.obs;

  @override
  void onInit() {
    // fetchCategory();
    super.onInit();
  }

  Future<void> fetchAllProductAdmin() async{
    var result = await ProductService.fetchAllProductAdmin();

    if(result.isNotEmpty){
      productList.assignAll(result);
    }

  }

  Future<void> addProduct({required Uint8List? image}) async{
    selectProduct.value.isImageExists=false;
    selectProduct.value.isImageChanged=true;
    var result = ProductService.addProduct(selectProduct.value, image!);
  }

  Future<void> fetchProductById(int id) async{
    var result = await ProductService.fetchProductById(id);
    selectProduct.value = result??HomeProductModel.empty();
    // CategoryModel category = CategoryModel(selectProduct.value.categoryId,selectProduct.value.categoryName,selectProduct.value.categoryImageUrl);
    // categoryController.selectedCategory.value = category;
    // print('selected product : ${selectProduct.value.id}');
    // print('selected category : ${categoryController.selectedCategory.value.name}');
    // print('selected category : ${categoryController.selectedCategory.value.imageUrl}');
    // print('selected category : ${categoryController.selectedCategory.value.id}');
    for(int i=0; i<categoryController.categoryList.length; i++){
      if(categoryController.categoryList[i].id == selectProduct.value.categoryId){
        categoryController.selectedCategory.value = categoryController.categoryList[i];
      }
    }
  }


  Future<void> updateProduct({required bool isImageChanged,required bool isImageExists, required Uint8List image}) async{
    HomeProductModel product = HomeProductModel.empty();
    // category.id = id;
    // category.name = name;
    // category.imageUrl = selectedCategory.value.imageUrl;
    // category.isImageChanged = isImageChanged;
    // category.isImageExists = isImageExists;
    selectProduct.value.isImageChanged = isImageChanged;
    selectProduct.value.isImageExists = isImageExists;

    var result = await ProductService.updateProduct(selectProduct.value,image);
    updateProductAction.value = false;
  }




}