import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/controllers.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        width: ResponsiveWidget.isSmallScreen(context) ? overallController.currentWidgetWidth.value
            : ResponsiveWidget.isMediumScreen(context) ? overallController.currentWidgetWidth.value * 0.7
            : overallController.currentWidgetWidth.value * 0.5,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero),
                    borderSide: BorderSide(
                      width: 1,
                      color: BORDER_GREY,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero),
                    borderSide: BorderSide(width: 1, color: BORDER_GREY),
                  ),
                  hintText: "Enter Your User ID",
                  hintStyle: TextStyle(
                    color: TEXT_DARK.withOpacity(0.3),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero),
                    borderSide: BorderSide(
                      width: 1,
                      color: BORDER_GREY,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero),
                    borderSide: BorderSide(width: 1, color: BORDER_GREY),
                  ),
                  hintText: "Enter Your User Password",
                  hintStyle: TextStyle(
                    color: TEXT_DARK.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
