import 'package:ecommercefrontend/constants/contants.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  const ResponsiveWidget({Key? key, required this.largeScreen, required this.mediumScreen, required this.smallScreen}) : super(key: key);


  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width < largeScreenSize;
  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width >= smallScreenSize && MediaQuery.of(context).size.width < mediumScreenSize;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      if(isLargeScreen(context)){
        return largeScreen;
      }
      else if(isMediumScreen(context)){
        return mediumScreen;
      }
      else{
        return smallScreen;
      }
    });
  }
}
