

import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
{

  static ProductController instance = Get.find();

  var selectedCategoryProductList = <ProductModel>[].obs;

  @override
  void onInit() {
    // fetchCategory();
    super.onInit();
  }

  // Future<void> fetchCategory() async{
  //   var result = await ApiService.homeCategory({});
  //   print('-------------------------->   : Category list size : ${result.length}');
  //   categoryList.addAll(result);
  // }

}