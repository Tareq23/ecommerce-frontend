
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class ProductService
{


  static Future<List<ProductModel>> fetchAllProductAdmin() async {
    await authenticationController.getToken();
    try {
      var response = await ApiService.action(
        url: API.ADMIN_SHOW_ALL_PRODUCT,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
          'Bearer ${authenticationController.accessToken.value}',
        },
        body: {},
        actionType: 'get',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body) as List;
        return jsonString
            .map((e) => ProductModel.parseJson(e))
            .toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return [];
  }

  static Future<dynamic> addProduct(ProductModel product, Uint8List image) async {
    await authenticationController.getToken();
    return ApiService.action(
        url: API.ADMIN_ADD_PRODUCT,
        actionType: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization':
          'Bearer ${authenticationController.accessToken.value}',
        },
        multipart: true,
        file: image,
        body: product,
        isImageChanged: true,
    );
  }


  static Future deleteProduct(ProductModel product) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    return ApiService.action(
      url: API.DELETE_CATEGORY_URL,
      actionType: 'delete',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: product,
    );
  }


  static Future updateProduct(ProductModel product, Uint8List image) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    print('updateProduct api service selected product : ${product.id}');
    return ApiService.action(
      url: API.ADMIN_PRODUCT_UPDATE_WITH_IMAGE,
      actionType: 'put',
      multipart: product.isImageChanged! || product.isImageExists!,
      file: image,
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      isImageChanged: product.isImageChanged!,
      isImageExists: product.isImageExists!,
      body: product,
    );
  }

  static Future<dynamic> fetchProductById(int id) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    var response = await ApiService.action(
      url: '${API.ADMIN_PRODUCT_DETAILS_BY_ID}$id',
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
      return ProductModel.parseJsonWithCategory(jsonString);
    }
    return ProductModel.empty();
  }
}