import 'package:ecommercefrontend/controller/item_button_controller.dart';
import 'package:ecommercefrontend/controller/overall_controller.dart';
import 'package:ecommercefrontend/controller/route_state_controller.dart';
import 'package:ecommercefrontend/landing/landing_page.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';


void main() {
  usePathUrlStrategy();
  Get.put(ItemButtonController());
  Get.put(OverallController());
  Get.put(StateController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

