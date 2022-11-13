

import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
import 'package:ecommercefrontend/services/api/product_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
{

  static ProductController instance = Get.find();



  var selectProduct = ProductModel.empty().obs;



  var productListSerial = 0.obs;
  var productList = <ProductModel>[].obs;


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
    selectProduct.value = result??ProductModel.empty();
  }

}