import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/authentication/login_model.dart';
import 'package:ecommercefrontend/models/authentication/register_model.dart';
import 'package:ecommercefrontend/models/location/division_model.dart';
import 'package:ecommercefrontend/services/api/auth_api_service.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
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
  var isLogIn = false.obs;
  var isAdmin = false.obs;
  var isManager = false.obs;
  var isCustomer = false.obs;
  var userLogin = LoginModel("", "", "", false, false, false).obs;


  // user register info
  var userRegister = RegisterModel("", "", "", "", "").obs;
  var isRegisterAction = false.obs;

  var checkOnInit = false.obs;

  @override
  void onInit() async {
    if(!checkOnInit.value){
      await isLoggedIn();
      checkOnInit.value = true;
    }

    super.onInit();
  }

  Future<void> login() async {
    CredentialModel credential = CredentialModel(loginUsername.value,loginPassword.value);
    var result = await AuthService.userLogin(credential);
    if(result.token != null){
      accessToken.value = result.token!;
      await _setToken(result);
    }
    isLoginAction.value = false;
  }


  Future<void> register() async{
    var result = await AuthService.userRegister(<String,String>{
      "username" : userRegister.value.username.toString(),
      "firstName" : userRegister.value.firstName.toString(),
      "lastName" : userRegister.value.lastName.toString(),
      "phoneNumber" : userRegister.value.phoneNumber.toString(),
      "password" : userRegister.value.password.toString(),
    });
    if(result.username!.contains(userRegister.value.username.toString())){
      loginUsername.value = result.username.toString();
      loginPassword.value = userRegister.value.password.toString();
      await login();
    }
    isRegisterAction.value = false;
  }


  Future<bool> isLoggedIn() async{
    await getToken();
    // isLogIn.value = false;
    if(accessToken.value.isEmpty){
      print('is loged in -----------> ${accessToken.value.isEmpty}');
      return false;
    }
    bool checkLoggedIn = JwtDecoder.isExpired(accessToken.value);


    // int time = JwtDecoder.getRemainingTime(accessToken.value).inSeconds;
    // print('getRemainingTime -----------> ${JwtDecoder.getRemainingTime(accessToken.value).inSeconds} $time');
    if(!checkLoggedIn){
      isLogIn.value = true;
      isAdmin.value = JwtService.isSuperAdmin();
      isManager.value = JwtService.isManager();
      isCustomer.value = JwtService.isCustomer();
      print('checkLoggedIn -----------> ${checkLoggedIn}');
      return true;
    }
    // await _setToken(LoginModel("", "", "", false, false, false));
    await logout();
    return false;
  }






  Future<void> _setToken(LoginModel loginModel) async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('token', loginModel.token!);
    prefs.setBool('admin', JwtService.isSuperAdmin());
    prefs.setBool('customer', JwtService.isCustomer());
    prefs.setBool('manager', JwtService.isManager());
    await isLoggedIn();
  }

  Future<void> getToken() async{
    final SharedPreferences prefs = await sharedPreference;
    accessToken.value = prefs.getString('token')??'';
    isAdmin.value = prefs.getBool('admin')??false;
    isManager.value = prefs.getBool('manager')??false;
    isCustomer.value = prefs.getBool('customer')??false;
  }

  Future<void> logout() async{
    accessToken.value = '';
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('token', '');
    prefs.setBool('admin', false);
    prefs.setBool('customer', false);
    prefs.setBool('manager', false);
    isLogIn.value = false;
  }

}