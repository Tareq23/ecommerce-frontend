import 'dart:convert';

import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> _action(
      {required String url,
      required Map<String, String> headers,
      required Object body,
      String? actionType}) async {
    if (actionType!.toLowerCase().contains("post")) {
      return await http.post(
        Uri.parse(url),
        headers: headers,
        // body: {"username":loginModel.username,"password":loginModel.password},
        body: jsonEncode(body),
      );
    }

    return await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  static Future<LoginModel> userLogin(CredentialModel credential) async {
    try {
      var url = Uri.parse(API.LOGIN_URL);
      var response = await _action(
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
      var response = await _action(
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
      print("exception error ----> : $e");
    }
    return RegisterModel.empty();
  }

}
