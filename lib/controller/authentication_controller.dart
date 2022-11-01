

import 'dart:convert';
import 'dart:js';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';
import 'package:ecommercefrontend/services/jwt/jwt_service.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController
{
  static AuthenticationController instance = Get.find();



  var isSuperAdmin = false.obs;



  // user login info
  var loginUsername = ''.obs;
  var loginPassword = ''.obs;
  var accessToken = ''.obs;
  var isLoginAction = false.obs;
  var isLogoutAction = false.obs;
  var userLogin = LoginModel("", "", "", false, false, false).obs;


  // user register info
  var userRegister = RegisterModel("", "", "", "", "").obs;
  var isRegisterAction = false.obs;

  @override
  void onInit() {
    _getToken();
    super.onInit();
  }

  Future<void> login() async {
    CredentialModel credential = CredentialModel(loginUsername.value,loginPassword.value);
    var result = await ApiService.userLogin(credential);
    if(result.token != null){
      _setToken(result.token!);
      // print('----------------- controller login method : ${result.isAdmin}');
      // print('----------------- controller login method : ${result.isManager}');
      // print('----------------- controller login method : ${result.isCustomer}');
      accessToken.value = result.token!;
      userLogin.value = result;
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

  bool isExpired(){
    // isSuperAdmin.value = JwtService.isSuperAdmin();
    _validToken();
    if(authenticationController.accessToken.value.length<20) return false;
    print('-----  jwt service -----------is expired');
    return  JwtDecoder.isExpired(accessToken.value);
  }



  _validToken(){
    final checkToken = accessToken.value.split(".");
    if(checkToken.length == 3){
      print('----access token first part ----- ${checkToken[0]}');
    }
    else{
      print('----------------------------> invalid token');
    }
  }






  Future<void> _setToken(String token) async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('token', token);
    prefs.setBool('admin', userLogin.value.isAdmin!);
    prefs.setBool('customer', userLogin.value.isAdmin!);
    prefs.setBool('manager', userLogin.value.isAdmin!);
    await _getToken();
  }

  Future<void> _getToken() async{
    final SharedPreferences prefs = await sharedPreference;
    accessToken.value = prefs.getString('token')??'';
    userLogin.value.isAdmin = prefs.getBool('admin')??false;
    userLogin.value.isManager = prefs.getBool('manager')??false;
    userLogin.value.isCustomer = prefs.getBool('customer')??false;
  }

  Future<void> logout() async{
    accessToken.value = '';
    final SharedPreferences prefs = await sharedPreference;
    prefs.reload();
    isLogoutAction = false.obs;
  }

}