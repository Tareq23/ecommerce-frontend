

import 'package:ecommercefrontend/controller/authentication_controller.dart';
import 'package:ecommercefrontend/controller/item_button_controller.dart';
import 'package:ecommercefrontend/controller/overall_controller.dart';
import 'package:ecommercefrontend/controller/route_state_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

ItemButtonController itemButtonController = ItemButtonController.instance;
OverallController overallController = OverallController.instance;
StateController stateController = StateController.instance;
AuthenticationController authenticationController = AuthenticationController.instance;

final Future<SharedPreferences> sharedPreference = SharedPreferences.getInstance();