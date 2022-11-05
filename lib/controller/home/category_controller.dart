

import 'dart:typed_data';

import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{

  static CategoryController instance = Get.find();

  var categoryList = <CategoryModel>[].obs;

  var isLoadImage = false.obs;
  var missingImage = false.obs;
  var uploadCategoryAction = false.obs;

  var selectedCategory = CategoryModel.empty().obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async{
    var result = await ApiService.homeCategory({});
    categoryList.assignAll(result);
  }

  Future<void> deleteCategory() async{
    await ApiService.deleteCategory(selectedCategory.value);
    await fetchCategory();
  }

  Future<void> addCategory({required Uint8List? image,required String name}) async{
    CategoryModel category = CategoryModel.addNew(name: name);
    var result = await ApiService.uploadCategory(category, image!);
    uploadCategoryAction.value = false;
  }


  Future<void> updateCategoryName() async{
    await ApiService.updateCategory(selectedCategory.value);
    await fetchCategory();
  }
  Future<void> fetchCategoryById(int id) async{
    await ApiService.fetchCategoryById(id);
    await fetchCategory();
  }


}