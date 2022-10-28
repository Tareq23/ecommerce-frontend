import 'dart:convert';

import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:http/http.dart' as http;

class ApiService {


  static Future<LoginModel> getUsers(CredentialModel credential) async {
    try {
      var url = Uri.parse(API.LOGIN_URL);
      print('------------ ${url}');
      // print('------------ ${url} ${loginModel.password}');
      // print('------------ ${url} ${loginModel.username}');
      var response = await http.post(
        url,
        headers: <String,String>{
          'Content-Type': 'application/json',
        },
        // body: {"username":loginModel.username,"password":loginModel.password},
        body: jsonEncode(<String,String>{'username':credential.username.toString(),'password':credential.password.toString()}),
      );
      print('------------status code :  ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        return LoginModel.parseJson(jsonString);
      }
    } catch (e) {
      print("exception error ----> : $e");
    }
    return LoginModel.empty();
  }
}
