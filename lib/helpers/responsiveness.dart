import 'package:flutter/material.dart';


const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;


class ResponsiveWidget extends StatelessWidget {

  final Widget largeScreen;
  Widget? smallScreen;
  Widget? mediumScreen;
  ResponsiveWidget({Key? key,required this.largeScreen, this.mediumScreen,this.smallScreen}) : super(key: key);


  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize &&
                                                      MediaQuery.of(context).size.width <largeScreenSize;
  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width<mediumScreenSize &&
                                                     MediaQuery.of(context).size.width>=smallScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,constraints){
      double _width = constraints.maxWidth;
      if(_width>=largeScreenSize){
        return largeScreen;
      }
      else if(_width>=mediumScreenSize && _width<largeScreenSize){
        return mediumScreen??largeScreen;
      }
      else{
        return smallScreen??mediumScreen??largeScreen;
      }
    });
  }
}
