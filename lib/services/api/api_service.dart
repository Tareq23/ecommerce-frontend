import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/models/home/category_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static Future<dynamic> _action(
      {required String url,
      required Map<String, String> headers,
      required Object body,
      bool multipart = false,
      Uint8List? file,
      String? actionType}) async {
    if (actionType!.toLowerCase().contains("post")) {
      // uploaded with file
      if (multipart) {
        var request = http.MultipartRequest("POST", Uri.parse(url));
        request.headers.addAll(headers);
        request.fields['name'] = jsonEncode(body);

        request.files.add(
          http.MultipartFile.fromBytes('file', file!,
              contentType: MediaType('application', 'json'),
              filename: 'Any_name.jpg'),
        );

        int statusCode = 400;
        await request.send().then((response) {
          print('---------------> Status code : ${response.statusCode}');
          if (response.statusCode == 200 || response.statusCode == 201) {
            statusCode = response.statusCode;
          }
        });
        return statusCode;
      }
      // uploaded without file
      return await http.post(
        Uri.parse(url),
        headers: headers,
        // body: {"username":loginModel.username,"password":loginModel.password},
        body: jsonEncode(body),
      );
    }
    if (actionType.toLowerCase().contains("delete")) {
      return await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
    }
    if (actionType.toLowerCase().contains("put")) {
      return await http.put(
        Uri.parse(url),
        headers: headers,
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

  static Future<List<CategoryModel>> homeCategory(Object object) async {
    try {
      var response = await _action(
        url: API.CATEGORY_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        body: object,
        actionType: 'get',
      );

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body) as List;
        return jsonString
            .map((e) => CategoryModel.parseJsonWithoutProduct(e))
            .toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return [];
  }

  static Future<void> checkUserRole(Object object) async {
    try {
      var response = await _action(
        url: API.CHECK_ROLE,
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          "token": object.toString(),
          "username": "superadmin",
          "password": "12345678"
        },
        actionType: 'post',
      );
      if (response.statusCode == 200) {
        // var jsonString = jsonDecode(response.body) as List;
        // return jsonString.map((e) => CategoryModel.parseJsonWithoutProduct(e)).toList();
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    // return [];
  }

  static Future uploadCategory(CategoryModel category, Uint8List image) async {
    await authenticationController.getToken();
    return _action(
        url: API.ADD_CATEGORY_URL,
        actionType: 'post',
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization':
              'Bearer ${authenticationController.accessToken.value}',
        },
        multipart: true,
        file: image,
        body: category);
  }

  static Future deleteCategory(CategoryModel category) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    return _action(
      url: API.DELETE_CATEGORY_URL,
      actionType: 'delete',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: category,
    );
  }
  static Future updateCategory(CategoryModel category) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    return _action(
      url: API.UPDATE_CATEGORY_URL,
      actionType: 'put',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: category,
    );
  }

  static Future<CategoryModel> fetchCategoryById(int id) async {
    await authenticationController.getToken();
    // print('Bearer ${authenticationController.accessToken.value}');
    var response = await _action(
      url: '${API.FETCH_CATEGORY_BY_ID_URL}$id',
      actionType: 'get',
      headers:<String,String> {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print('category json $jsonString');
      return CategoryModel.parseJsonWithoutProduct(jsonString);
    }
    return CategoryModel.empty();
  }
}
