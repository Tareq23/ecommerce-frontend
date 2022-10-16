
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../landing/landing_page.dart';


class CustomRouter
{
  static final FluroRouter router = FluroRouter();

  // static Handler _splashHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  //       return SplashScreen();
  //     }
  // );

  // home page root url
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
        return LandingPage(); // this one is for passing one parameter
      }
  );

  // lets create two parameter passing url

  // static Handler _pro = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
  //       return ProductPage(page: parameters['name']![0],extra: parameters['extra']![0],); // this one is for passing one parameter
  //     }
  // );


  static void setupRoute()
  {
    router.define('/', handler: _homeHandler);
    // router.define('/main/:name', handler: _mainHandler,transitionType: TransitionType.fadeIn);
    // router.define('/main/:name/:extra', handler: _mainHandler2,transitionType: TransitionType.fadeIn);
  }

}