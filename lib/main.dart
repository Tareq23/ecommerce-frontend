import 'package:ecommercefrontend/app_layout.dart';
import 'package:ecommercefrontend/controllers/menu_controller.dart';
import 'package:ecommercefrontend/controllers/navigation_controller.dart';
import 'package:ecommercefrontend/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce Online Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor: Colors.black
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS : FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android : FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        primaryColor: Colors.blue
      ),
      home: AppLayout()
    );
  }
}


