

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class OrderService{

  static Future<dynamic> addOrder(Object object) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_ORDER_ADD,
      actionType: 'post',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: object,
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }
  static Future<dynamic> getOrderFromCustomer() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_ORDER_ALL,
      actionType: 'get',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body) as List;
      return jsonString.map((e) => OrderModel.parseJson(e)).toList();
    }
    return [];
  }

}