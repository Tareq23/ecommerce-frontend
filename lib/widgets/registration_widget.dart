
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {


  List<TextEditingController> registerFieldsController =
  List.generate(5, (i) => TextEditingController());

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
              controller: registerFieldsController.elementAt(3),
              style: _formFieldTextStyle(context),
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
              child: OutlinedButton(
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
                onPressed: () {

                },

                child: CustomText(
                  text: "Register",
                  color: TEXT_WHITE,
                  size: 18,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
