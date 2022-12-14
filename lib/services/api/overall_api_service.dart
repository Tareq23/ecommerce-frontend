

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
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


}