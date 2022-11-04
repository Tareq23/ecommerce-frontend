import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveWidget extends StatefulWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  const ResponsiveWidget({Key? key, required this.largeScreen, required this.mediumScreen, required this.smallScreen}) : super(key: key);


  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width >= mediumScreenSize && MediaQuery.of(context).size.width < largeScreenSize;
  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width >= smallScreenSize && MediaQuery.of(context).size.width < mediumScreenSize;

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {


  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   overallController.screenWidth.value = MediaQuery.of(context).size.width;
    //   overallController.screenHeight.value = MediaQuery.of(context).size.height;
    //   commonPadding = overallController.screenWidth.value * 0.07;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    overallController.screenWidth.value = MediaQuery.of(context).size.width;
    overallController.screenHeight.value = MediaQuery.of(context).size.height;
    commonPadding = overallController.screenWidth.value * 0.07;


    overallController.adminSideNavWidth.value = overallController.screenWidth.value * 0.17;
    overallController.adminSideNavHeight.value = overallController.screenHeight.value;

    overallController.adminMainContentWidth.value = overallController.screenWidth.value * 0.83;
    overallController.adminMainContentHeight.value = overallController.screenHeight.value;
    

    return LayoutBuilder(builder: (context,constraint){
      if(ResponsiveWidget.isLargeScreen(context)){

        return widget.largeScreen;
      }
      else if(ResponsiveWidget.isMediumScreen(context)){
        return widget.mediumScreen;
      }
      else{
        return widget.smallScreen;
      }
    });
    // return Obx((){
    //   overallController.screenWidth.value = MediaQuery.of(context).size.width;
    //   overallController.screenHeight.value = MediaQuery.of(context).size.height;
    //   return LayoutBuilder(builder: (context,constraint){
    //     if(ResponsiveWidget.isLargeScreen(context)){
    //
    //       return widget.largeScreen;
    //     }
    //     else if(ResponsiveWidget.isMediumScreen(context)){
    //       return widget.mediumScreen;
    //     }
    //     else{
    //       return widget.smallScreen;
    //     }
    //   });
    // });
  }
}
