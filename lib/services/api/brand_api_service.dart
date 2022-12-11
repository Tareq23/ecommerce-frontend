import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/brand_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class BrandApiService {


  static Future<dynamic> addBrand(BrandModel brand) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.ADMIN_ADD_BRAND,
      actionType: 'post',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: brand,
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      // print('category json $jsonString');
      return BrandModel.parseJson(jsonString);
    }
    return BrandModel.empty();
  }

  static Future<dynamic> delete(BrandModel brand) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.ADMIN_DELETE_BRAND,
      actionType: 'delete',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: brand,
    );
    if (response.statusCode == 200 || response.statusCode == 202) {
      return true;
    }
    return false;
  }

  static Future<List<BrandModel>> getAllBrand() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.ADMIN_SHOW_ALL_BRAND,
      actionType: 'get',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body) as List;
      // print(jsonString);
      return jsonString
          .map((e) => BrandModel.parseJson(e))
          .toList();
    }
    return [];
  }



  static Future<BrandModel> updateBrand(BrandModel brand) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.ADMIN_UPDATE_BRAND,
      actionType: 'put',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: brand,
    );

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);

      return BrandModel.parseJson(jsonString);
    }
    return BrandModel.empty();
  }



  static Future<BrandModel> getBrand(int id) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: '${API.ADMIN_SHOW_BRAND_BY_ID}$id',
      actionType: 'get',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      // print('category json $jsonString');
      return BrandModel.parseJson(jsonString);
    }
    return BrandModel.empty();
  }


}
