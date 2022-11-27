import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/controller/address_location_controller.dart';
import 'package:ecommercefrontend/controller/authentication_controller.dart';
import 'package:ecommercefrontend/controller/brand_controller.dart';
import 'package:ecommercefrontend/controller/home/category_controller.dart';
import 'package:ecommercefrontend/controller/home/product_controller.dart';
import 'package:ecommercefrontend/controller/item_button_controller.dart';
import 'package:ecommercefrontend/controller/order_controller.dart';
import 'package:ecommercefrontend/controller/overall_controller.dart';
import 'package:ecommercefrontend/controller/route_state_controller.dart';
import 'package:ecommercefrontend/services/jwt/jwt_service.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

void main() {
  usePathUrlStrategy();
  Get.put(ItemButtonController());
  Get.put(OverallController());
  Get.put(StateController());
  Get.put(AuthenticationController());
  Get.put(CategoryController());
  Get.put(ProductController());
  Get.put(LocationController());
  Get.put(BrandController());
  Get.put(OrderController());
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
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: ROOT_BACKGROUND_COLOR,
        highlightColor: HIGH_LIGHT_COLOR,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
