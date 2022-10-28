

import 'dart:convert';
import 'dart:js';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController
{
  static AuthenticationController instance = Get.find();

  // user login info
  var loginUsername = ''.obs;
  var loginPassword = ''.obs;
  var accessToken = ''.obs;
  var isLoginAction = false.obs;
  var isLogoutAction = false.obs;

  var isRegisterAction = false.obs;


  // user register info
  var userRegister = RegisterModel("", "", "", "", "").obs;

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  Future<void> login() async {
    CredentialModel credential = CredentialModel(loginUsername.value,loginPassword.value);
    var result = await ApiService.userLogin(credential);
    if(result.token != null){
      _setToken(result.token!);
      accessToken.value = result.token!;
    }
    print("login : ${accessToken.value}");
    isLoginAction.value = false;
  }


  Future<void> register() async{
    var result = await ApiService.userRegister(<String,String>{
      "username" : userRegister.value.username.toString(),
      "firstName" : userRegister.value.firstName.toString(),
      "lastName" : userRegister.value.lastName.toString(),
      "phoneNumber" : userRegister.value.phoneNumber.toString(),
      "password" : userRegister.value.password.toString(),
    });
    print('-----------------user register email : => ${result.username}');
    print('-----------------user register last name : => ${result.firstName}');
    print('-----------------user register first name : => ${result.lastName}');
    print('-----------------user register password : => ${result.password}');
    if(result.username!.contains(userRegister.value.username.toString())){
      loginUsername.value = result.username.toString();
      loginPassword.value = userRegister.value.password.toString();
      await login();
    }
    isRegisterAction.value = false;
  }









  Future<void> _setToken(String token) async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('token', token);
    await getToken();
  }

  Future<void> getToken() async{
    final SharedPreferences prefs = await sharedPreference;
    accessToken.value = prefs.getString('token')??'';
    print('get token : $accessToken');
  }

  Future<void> logout() async{
    accessToken.value = '';
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('token','');
    prefs.reload();
    isLogoutAction = false.obs;
  }

}