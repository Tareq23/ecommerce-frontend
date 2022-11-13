import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';


class CategoryService {

  static Future<List<CategoryModel>> homeCategory(Object object) async {
    try {
      var response = await ApiService.action(
        url: API.CATEGORY_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        body: object,
        actionType: 'get',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body) as List;
        return jsonString
            .map((e) => CategoryModel.parseJsonWithoutProduct(e))
            .toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return [];
  }
  static Future<List<CategoryModel>> fetchAllCategoryAdmin(Object object) async {
    await authenticationController.getToken();
    try {
      var response = await ApiService.action(
        url: API.ADMIN_SHOW_ONLY_CATEGORY_URL,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
          'Bearer ${authenticationController.accessToken.value}',
        },
        body: object,
        actionType: 'get',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body) as List;
        return jsonString
            .map((e) => CategoryModel.parseJsonWithoutProduct(e))
            .toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return [];
  }

  static Future<void> checkUserRole(Object object) async {
    try {
      var response = await ApiService.action(
        url: API.CHECK_ROLE,
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          "token": object.toString(),
          "username": "superadmin",
          "password": "12345678"
        },
        actionType: 'post',
      );
      if (response.statusCode == 200) {
        // var jsonString = jsonDecode(response.body) as List;
        // return jsonString.map((e) => CategoryModel.parseJsonWithoutProduct(e)).toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    // return [];
  }

  static Future addCategory(CategoryModel category, Uint8List image) async {
    await authenticationController.getToken();
    return ApiService.action(
        url: API.ADD_CATEGORY_URL,
        actionType: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization':
              'Bearer ${authenticationController.accessToken.value}',
        },
        multipart: true,
        file: image,
        body: category);
  }

  static Future deleteCategory(CategoryModel category) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    return ApiService.action(
      url: API.DELETE_CATEGORY_URL,
      actionType: 'delete',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: category,
    );
  }


  static Future updateCategory(CategoryModel category, Uint8List image) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    return ApiService.action(
      url: category.isImageChanged!? API.UPDATE_CATEGORY_WITH_IMAGE_URL : API.UPDATE_CATEGORY_URL,
      actionType: 'put',
      multipart: category.isImageChanged!,
      file: image,
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      isImageChanged: category.isImageChanged!,
      isImageExists: category.isImageExists!,
      body: category,
    );
  }

  static Future<CategoryModel> fetchCategoryById(int id) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    var response = await ApiService.action(
      url: '${API.FETCH_CATEGORY_BY_ID_URL}$id',
      actionType: 'get',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    // print('Future<CategoryModel> fetchCategoryById status code : ${response.statusCode} \n response :  ${response.body}');
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      // print('category json $jsonString');
      return CategoryModel.parseJsonWithoutProduct(jsonString);
    }
    return CategoryModel.empty();
  }
}
