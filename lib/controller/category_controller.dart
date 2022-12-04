

import 'dart:typed_data';

import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{

  static CategoryController instance = Get.find();

  var categoryListSerial = 0.obs;


  var categoryList = <HomeCategoryModel>[].obs;
  var categoryListAdmin = <HomeCategoryModel>[].obs;
  var categoryListWithProduct = <CategoryModel>[].obs;

  var isLoadImage = false.obs;
  var isFetchCategoryById = false.obs;
  var missingImage = false.obs;
  var uploadCategoryAction = false.obs;
  var updateCategoryAction = false.obs;

  var selectedCategory = HomeCategoryModel.empty().obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory() async{
    var result = await CategoryService.homeCategory({});
    categoryList.assignAll(result);
  }

  Future<void> fetchCategoryAllAdmin() async{
    var result = await CategoryService.fetchAllCategoryAdmin({});
    categoryListAdmin.assignAll(result);
  }

  Future<void> deleteCategory() async{
    await CategoryService.deleteCategory(selectedCategory.value);
    await fetchCategory();
  }

  Future<void> addCategory({required Uint8List? image,required String name}) async{
    HomeCategoryModel category = HomeCategoryModel.addNew(name: name);
    var result = await CategoryService.addCategory(category, image!);
    uploadCategoryAction.value = false;
  }


  // Future<void> updateCategoryName() async{
  //   await ApiService.updateCategory(selectedCategory.value);
  //   await fetchCategory();
  // }
  Future<void> fetchCategoryById(int id) async{
    selectedCategory.value = await CategoryService.fetchCategoryById(id);
    isFetchCategoryById.value = false;

  }
  Future<void> updateCategory({required bool isImageChanged,required int id,required bool isImageExists, required Uint8List image,required String name}) async{
    HomeCategoryModel category = HomeCategoryModel.empty();
    category.id = id;
    category.name = name;
    category.imageUrl = selectedCategory.value.imageUrl;
    category.isImageChanged = isImageChanged;
    category.isImageExists = isImageExists;
    var result = await CategoryService.updateCategory(category,image);
    updateCategoryAction.value = false;
  }

  Future<void> fetchAllCategoryWithProductForHomePage() async{
    var result = await CategoryService.fetchAllCategory({});

    categoryListWithProduct.assignAll(result);

  }

}