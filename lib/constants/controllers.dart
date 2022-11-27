

import 'package:ecommercefrontend/controller/address_location_controller.dart';
import 'package:ecommercefrontend/controller/authentication_controller.dart';
import 'package:ecommercefrontend/controller/brand_controller.dart';
import 'package:ecommercefrontend/controller/home/category_controller.dart';
import 'package:ecommercefrontend/controller/home/product_controller.dart';
import 'package:ecommercefrontend/controller/item_button_controller.dart';
import 'package:ecommercefrontend/controller/order_controller.dart';
import 'package:ecommercefrontend/controller/overall_controller.dart';
import 'package:ecommercefrontend/controller/route_state_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

ItemButtonController itemButtonController = ItemButtonController.instance;
OverallController overallController = OverallController.instance;
StateController stateController = StateController.instance;
AuthenticationController authenticationController = AuthenticationController.instance;
CategoryController categoryController = CategoryController.instance;
ProductController productController = ProductController.instance;
LocationController locationController = LocationController.instance;
BrandController brandController = BrandController.instance;
OrderController orderController = OrderController.instance;

final Future<SharedPreferences> sharedPreference = SharedPreferences.getInstance();