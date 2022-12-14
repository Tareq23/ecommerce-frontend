

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class AddressService {


  static Future<dynamic> addAddress(AddressModel addressModel) async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_ADDRESS_ADD,
      actionType: 'post',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: addressModel,
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body);
      return AddressModel.parseJson(jsonString);
    }

    return AddressModel.empty();
  }
  static Future<dynamic> getAddress() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_ADDRESS_All,
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
      return jsonString.map((e) => AddressModel.parseJson(e)).toList();
    }

    return [];
  }
  static Future<dynamic> updateDefaultAddress(int id) async {
    print(id);
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: '${API.CUSTOMER_DEFAULT_ADDRESS_UPDATE}$id',
      actionType: 'put',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    print(id);
    print('update address status code : ${response.statusCode}');
    if(response.statusCode == 200 || response.statusCode == 202 || response.statusCode == 201){
      print('update address status code : ${response.statusCode}');
      return true;
    }

    return false;
  }


}