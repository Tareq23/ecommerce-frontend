
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {

  final formKey = GlobalKey<FormState>();

  List<TextEditingController> registerFieldsController =
  List.generate(5, (i) => TextEditingController(),);


  @override
  void initState() {

    for(int i=0; i<registerFieldsController.length; i++){
      switch(i){
        case 0:
          registerFieldsController[i].addListener(() {
            authenticationController.userRegister.value.firstName = registerFieldsController[i].text.trim();
          });
          break;
        case 1:
          registerFieldsController[i].addListener(() {
            authenticationController.userRegister.value.lastName = registerFieldsController[i].text.trim();
          });
          break;
        case 2:
          registerFieldsController[i].addListener(() {
            authenticationController.userRegister.value.username = registerFieldsController[i].text.trim();
          });
          break;
        case 3:
          registerFieldsController[i].addListener(() {
            authenticationController.userRegister.value.phoneNumber = registerFieldsController[i].text.trim();
          });
          break;
        case 4:
          registerFieldsController[i].addListener(() {
            authenticationController.userRegister.value.password = registerFieldsController[i].text.trim();
          });
          break;
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(authenticationController.accessToken.value.length>20){
        context.go('/');
      }
    });

    super.initState();
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
        color: const Color(0xff7c989f),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 30, vertical: overallController.screenHeight.value * 0.1),
      margin: EdgeInsets.symmetric(
        vertical: overallController.screenHeight.value * 0.15,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CustomText(
                text: "User Registration",
                color: TEXT_DARK,
                size: 24,
                weight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "First name",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              // initialValue: authenticationController.userRegister.value.firstName,
              controller: registerFieldsController.elementAt(0),
              validator:(value){
                return _validator(value!, 'First name');
              },
              style: _formFieldTextStyle(context),
              decoration: InputDecoration(
                hintText: 'First name',
                hintStyle: _hintStyle(context),
                border: _outlineInputBorder(context),
                focusedBorder: _outlineInputBorder(context),
                enabledBorder: _outlineInputBorder(context),
                focusColor: Color(0xff777575),
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Last name",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              // initialValue: authenticationController.userRegister.value.lastName,
              controller: registerFieldsController.elementAt(1),
              validator:(value){
                return _validator(value!, 'Last name');
              },
              style: _formFieldTextStyle(context),
              decoration: InputDecoration(
                hintText: 'Last name',
                hintStyle: _hintStyle(context),
                border: _outlineInputBorder(context),
                focusedBorder: _outlineInputBorder(context),
                enabledBorder: _outlineInputBorder(context),
                focusColor: Color(0xff777575),
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Email",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              // initialValue: authenticationController.userRegister.value.username,
              controller: registerFieldsController.elementAt(2),
              validator:(value){
                return _validator(value!, 'Email');
              },
              style: _formFieldTextStyle(context),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: _hintStyle(context),
                border: _outlineInputBorder(context),
                focusedBorder: _outlineInputBorder(context),
                enabledBorder: _outlineInputBorder(context),
                focusColor: Color(0xff777575),
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Mobile Number",
              color: TEXT_DARK,
              size: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 8),
            TextFormField(
              // initialValue: authenticationController.userRegister.value.phoneNumber,
              controller: registerFieldsController.elementAt(3),
              style: _formFieldTextStyle(context),
              validator: (value){
                return _validator(value!,'Number');
              },
              decoration: InputDecoration(
                hintText: 'Number',
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
              // initialValue: authenticationController.userRegister.value.password,
              validator: (value){
                return _validator(value!,'Password');
              },
              controller: registerFieldsController.elementAt(4),
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
                  uri: Uri.parse('/auth/login'),
                  builder: (BuildContext context,
                      Future<void> Function()? followLink) {
                    return NavItem(
                      title: "Already have an account?",
                      onTap: () {
                        context.go('/auth/login');
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
                if(!authenticationController.isRegisterAction.value){

                  return OutlinedButton(
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
                    onPressed: () async{
                      if(formKey.currentState!.validate()){
                        authenticationController.isRegisterAction.value = true;
                        await authenticationController.register();
                        _checkAccessToken();
                      }
                    },

                    child: const CustomText(
                      text: "Register",
                      color: TEXT_WHITE,
                      size: 18,
                      weight: FontWeight.w500,
                    ),
                  );
                }
                else{
                  return CircularProgressIndicator(
                    color: YELLOW.withOpacity(0.8),
                  );
                }
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
    value = value.trim();
    if(value?.trim().length==0 || value == null){
      return "$title field required!";
    }
    print('------------------> Fitst Name : ${title.toLowerCase()}');

    switch(title.toLowerCase()){
      case "password":
        print('user register ------------> password ${authenticationController.userRegister.value.password}');
        if(authenticationController.userRegister.value.password!.length<6 || authenticationController.userRegister.value.password!.length>16){
          return 'Password length must be more that 6 characters and less than 16 characters';
        }
        break;
      case "email":
        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
        if(!emailValid){
          return 'Please enter valid email';
        }
        break;
      case "number":
        String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
        RegExp regExp = new RegExp(pattern);
        // print('phone number : => $value');
        if (!regExp.hasMatch(value) || value.trim().length <11 || value.trim().length>11) {
          return 'Please enter valid mobile number';
        }
        break;
      case "first name":
        if(authenticationController.userRegister.value.firstName!.length<4 || authenticationController.userRegister.value.firstName!.length>50){
          return 'First name must be more that 4 characters and less than 50 characters';
        }

        break;
      case "last name":
        if(authenticationController.userRegister.value.lastName!.length<4 || authenticationController.userRegister.value.lastName!.length>50){
          return 'Last name must be more that 4 characters and less than 50 characters';
        }
        break;

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
