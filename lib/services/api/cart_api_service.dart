


import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/cart_model.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class CartService {

  static Future<dynamic> addCart(CartModel cart) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_CART_ADD,
      actionType: 'post',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: cart,
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return CartModel.parseJson(jsonString);
    }

    return CartModel.empty();
  }
  static Future<dynamic> delete(CartModel cart) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_CART_DELETE,
      actionType: 'delete',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: cart,
    );
    if(response.statusCode == 200||response.statusCode == 202){
      return true;
    }

    return false;
  }
  static Future<dynamic> getAllCart(CartModel cart) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_CART_ALL,
      actionType: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: cart,
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body) as List;
      return jsonString.map((e) => CartModel.parseJson(e),);
    }

    return CartModel.empty();
  }


}