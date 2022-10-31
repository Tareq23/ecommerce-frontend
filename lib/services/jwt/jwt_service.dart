

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

    // if(!isLogin()) return false;

    Map<String, dynamic> decodedToken = JwtDecoder.decode(getToken().toString());
    if(decodedToken['ADMIN'] != null){
      return true;
    }
    return false;
  }

  static bool isCustomer(){
    if(!isLogin()) return false;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(getToken().toString());
    if(decodedToken['CUSTOMER'] != null){
      return true;
    }
    return false;
  }

  static bool isManager(){
    if(!isLogin()) return false;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(getToken().toString());
    if(decodedToken['MANAGER'] != null){
      return true;
    }
    return false;
  }

}