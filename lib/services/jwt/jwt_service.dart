

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtService{

  static Future<String> getToken() async{
    return authenticationController.accessToken.value;
  }

  static bool isExpired(){
    if(authenticationController.accessToken.value.length<20) return false;
    print('-----  jwt service -----------is expired}');
    return JwtDecoder.isExpired(getToken().toString());
  }

  static bool isLogin(){
    return isExpired();
  }

  static bool isSuperAdmin(){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(authenticationController.accessToken.value);
    print('JwtDecoder.decode(authenticationController.accessToken.value) ----------> $decodedToken');
    if(decodedToken['ADMIN'] != null || decodedToken['isAdmin'] != null){
      return true;
    }
    return false;
  }

  static bool isCustomer(){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(authenticationController.accessToken.value);
    if(decodedToken['CUSTOMER'] != null || decodedToken['isCustomer'] != null){
      print('JwtDecoder.decode(authenticationController.accessToken.value) isCustomer ----------> $decodedToken');
      return true;
    }
    return false;
  }

  static bool isManager(){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(authenticationController.accessToken.value);
    if(decodedToken['MANAGER'] != null || decodedToken['isManager'] != null){
      return true;
    }
    return false;
  }

}