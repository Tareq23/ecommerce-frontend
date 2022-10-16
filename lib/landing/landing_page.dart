import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/screen/large_screen.dart';
import 'package:ecommercefrontend/screen/medium_screen.dart';
import 'package:ecommercefrontend/screen/small_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      mediumScreen: MediumScreen(),
      smallScreen: SmallScreen(),
    );
  }
}
