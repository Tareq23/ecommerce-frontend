

import 'dart:convert';

import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class AuthService
{
  static Future<LoginModel> userLogin(CredentialModel credential) async {
    try {
      var response = await ApiService.action(
        url: API.LOGIN_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          'username': credential.username.toString(),
          'password': credential.password.toString()
        },
        actionType: 'post',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return LoginModel.parseJson(jsonString);
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return LoginModel.empty();
  }

  static Future<RegisterModel> userRegister(Object object) async {
    try {
      var response = await ApiService.action(
        url: API.REGISTER_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        body: object,
        actionType: 'post',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return RegisterModel.parseJson(jsonString);
      }
    } catch (e) {
    }
    return RegisterModel.empty();
  }

}