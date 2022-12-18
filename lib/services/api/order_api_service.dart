

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

  static Future<dynamic> getAllOrderForAdmin() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.AMDIN_ORDER_ALL,
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


  static Future<dynamic> getAllOrderForAdminByOrderStatus(String orderStatus) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: '${API.AMDIN_ORDER_BY_ORDER_STATUS}$orderStatus',
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


  static Future<dynamic> getOrderByIdForAdmin(int orderId) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: '${API.AMDIN_ORDER_BY_ORDER_ID}$orderId',
      actionType: 'get',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      print('order api service -------------> $jsonString');
      return OrderModel.parseJsonForSingleOrderByAdmin(jsonString);
    }
    return OrderModel.empty();
  }

  static Future<dynamic> updateOrderStatusFromAdmin(Object object) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.AMDIN_ORDER_STATUS_UPDATE,
      actionType: 'put',
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

}