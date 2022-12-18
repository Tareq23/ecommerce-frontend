

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

import '../../models/customer_model.dart';

class OverallApiService {

  static Future<CustomerModel> getUserInfo() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_INFO,
      actionType: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return CustomerModel.parseJson(jsonString);
    }

    return CustomerModel.empty();
  }

  static Future<CustomerModel> updateUserInfo(Object object) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_INFO_UPDATE,
      actionType: 'put',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: object,
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return CustomerModel.parseJson(jsonString);
    }

    return CustomerModel.empty();
  }


  static Future<dynamic> searchByProductName(String name) async{
    await authenticationController.getToken();
    print('search product name ======================: $name');
    var response = await ApiService.action(
      url: '${API.VISITOR_OR_CUSTOMER_PRODUCT_SEARCH_BY_NAME}$name',
      actionType: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body) as List;
      return jsonString.map((e) => ProductModel.parseJsonForProductDetails(e)).toList();
    }
    return [];
  }


}