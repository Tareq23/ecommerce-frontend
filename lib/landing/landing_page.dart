import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/screen/large_screen.dart';
import 'package:ecommercefrontend/screen/medium_screen.dart';
import 'package:ecommercefrontend/screen/small_screen.dart';
import 'package:flutter/material.dart';

import '../constants/controllers.dart';

class LandingPage extends StatelessWidget {
  final String title;
  const LandingPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    overallController.screenWidth.value = MediaQuery.of(context).size.width;
    overallController.screenHeight.value = MediaQuery.of(context).size.height;
    overallController.currentWidgetWidth.value = MediaQuery.of(context).size.width;
    overallController.currentWidgetHeight.value = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      largeScreen: LargeScreen(title: '/',),
      mediumScreen: MediumScreen(),
      smallScreen: SmallScreen(),
    );
  }
}
