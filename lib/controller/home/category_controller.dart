

import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{

  static CategoryController instance = Get.find();

  var categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async{
    var result = await ApiService.homeCategory({});
    print('-------------------------->   : Category list size : ${result.length}');
    categoryList.addAll(result);
  }

}