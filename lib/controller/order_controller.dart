

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController{

  static OrderController instance = Get.find();


  var singleOrder = OrderModel.empty().obs;

  Future<void> resetOrderedProductId() async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('productId','');
    prefs.setStringList('productIdList',[]);

  }

  Future<void> setOrderedProductId(int id) async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('productId',id.toString());
  }

  Future<void> setOrderedProductIdList(List<int> productIdList) async {
    final SharedPreferences prefs = await sharedPreference;
    List<String>temp = productIdList.map((e) => e.toString()).toList();
    prefs.setStringList('productId',temp);
  }
}