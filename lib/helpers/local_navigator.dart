

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/routing/router.dart';
import 'package:ecommercefrontend/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator()=> Navigator(
  key: navigationController.navigationKey,
  initialRoute: OverviewPageRoute,
  onGenerateRoute: generateRoute,
);