

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
import 'package:ecommercefrontend/services/api/product_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  static ProductController instance = Get.find();



  var selectProduct = HomeProductModel.empty().obs;


  var selectedProductForDetails = ProductModel.empty().obs;



  var productListSerial = 0.obs;
  var productList = <HomeProductModel>[].obs;


  var isLoadImage = false.obs;
  var isFetchProductById = false.obs;
  var missingImage = false.obs;
  var uploadProductAction = false.obs;
  var updateProductAction = false.obs;
  var isSelectCategory = true.obs;
  var isSelectBrand = true.obs;

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
    print('------------> $result');
  }

  Future<void> fetchProductById(int id) async{
    var result = await ProductService.fetchProductById(id);
    selectProduct.value = result??HomeProductModel.empty();

    for(int i=0; i<categoryController.categoryList.length; i++){
      if(categoryController.categoryList[i].id == selectProduct.value.categoryId){
        categoryController.selectedCategory.value = categoryController.categoryList[i];
        break;
      }
    }

    for(int i=0; i<brandController.brandList.length; i++){
      if(brandController.brandList[i].id == selectProduct.value.brandId){
        brandController.selectedBrand.value = brandController.brandList[i];
        break;
      }
    }
  }

  Future<void> fetchProductByIdForVisitorOrCustomer(int id) async{
    var result = await ProductService.fetchProductByIdForVisitorOrCustomer(id);
    selectedProductForDetails.value = result??ProductModel.empty();

    print('-------------  selectedProductForDetails  : ${selectedProductForDetails.value.title}');
  }


  Future<void> updateProduct({required bool isImageChanged,required bool isImageExists, required Uint8List image}) async{
    HomeProductModel product = HomeProductModel.empty();

    selectProduct.value.isImageChanged = isImageChanged;
    selectProduct.value.isImageExists = isImageExists;

    var result = await ProductService.updateProduct(selectProduct.value,image);
    print('--------------> update product model : ${jsonEncode(selectProduct.value)}');
    updateProductAction.value = false;
  }
  Future<void> updateProductWithoutImage({required bool isImageExists}) async{
    HomeProductModel product = HomeProductModel.empty();

    selectProduct.value.isImageExists = isImageExists;

    var result = await ProductService.updateProductWithoutImage(selectProduct.value);
    print('--------------> update product model : ${jsonEncode(selectProduct.value)}');
    updateProductAction.value = false;
  }


  Future<void> deleteProduct(HomeProductModel product) async{

    var result = await ProductService.deleteProduct(product);
    updateProductAction.value = false;
  }







}