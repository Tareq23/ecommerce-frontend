import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import '../constants/colors.dart';
import '../constants/controllers.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {

    _usernameController.addListener(() {
      authenticationController.loginUsername.value = _usernameController.text;
    });

    _passwordController.addListener(() {
      authenticationController.loginPassword.value = _passwordController.text;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      if(await authenticationController.isLoggedIn()){
        context.go('/');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context))
        ? overallController.screenWidth.value * 0.6
        : overallController.screenWidth.value * 0.7;
    return Container(
      width: _width,
      decoration: BoxDecoration(
        color: Color(0xff7c989f),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 30, vertical: overallController.screenHeight.value * 0.1),
      margin: EdgeInsets.symmetric(
        vertical: overallController.screenHeight.value * 0.15,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CustomText(
                text: "User Login",
                color: TEXT_DARK,
                size: 24,
                weight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "User Id",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value){
                return _validator(value!,'User Id');
              },
              controller: _usernameController,
              style: _formFieldTextStyle(context),
              decoration: InputDecoration(
                hintText: 'Email or Mobile number',
                hintStyle: _hintStyle(context),
                border: _outlineInputBorder(context),
                focusedBorder: _outlineInputBorder(context),
                enabledBorder: _outlineInputBorder(context),
                focusColor: Color(0xff777575),
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Password",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value){
                return _validator(value!,'Password');
              },
              controller: _passwordController,
              obscureText: true,
              style: _formFieldTextStyle(context),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: _hintStyle(context),
                border: _outlineInputBorder(context),
                focusedBorder: _outlineInputBorder(context),
                enabledBorder: _outlineInputBorder(context),
                focusColor: Color(0xff777575),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Link(
                  target: LinkTarget.self,
                  uri: Uri.parse('/auth/register'),
                  builder: (BuildContext context,
                      Future<void> Function()? followLink) {
                    return NavItem(
                      title: "Don't have an account?",
                      onTap: () {
                        context.go('/auth/register');
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Obx((){
                if(!authenticationController.isLoginAction.value){
                  return  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: BG_YELLOW,
                      fixedSize: Size.fromWidth(overallController.screenWidth.value * 0.15),
                      padding: EdgeInsets.symmetric(vertical: (overallController.screenWidth.value * 0.15)*0.1),
                      side: const BorderSide(
                          width: 1.8, color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    onPressed: ()async{
                      if (_formKey.currentState!.validate()) {
                        authenticationController.isLoginAction.value = true;
                        authenticationController.loginUsername.value.trim();
                        authenticationController.loginPassword.value.trim();
                        await authenticationController.login();
                        _checkAccessToken();
                      }
                    },
                    child: const CustomText(
                      text: "Login",
                      color: TEXT_WHITE,
                      size: 18,
                      weight: FontWeight.w500,
                    ),
                  );
                }
                return circularProgressIndicator();

              })
            ),
          ],
        ),
      ),
    );
  }

  _checkAccessToken(){
    if(authenticationController.accessToken.value.length>20){
      // context.go('/');
      context.replace('/');
    }
  }

  String? _validator(String value,String title){
    if(value?.trim().length==0 || value == null){
      return "$title field required!";
    }
    return null;
  }

  TextStyle _formFieldTextStyle(BuildContext context) {
    return const TextStyle(
      color: TEXT_WHITE,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }

  TextStyle _hintStyle(BuildContext context) {
    return TextStyle(
      color: TEXT_WHITE.withOpacity(0.6),
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1.2,
        color: TEXT_WHITE.withOpacity(0.7),
      ),
    );
  }
}
