import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/cart_model.dart';
import 'package:ecommercefrontend/models/order_details_model.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/services/api/order_api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  var singleOrder = OrderModel.empty().obs;

  var orderList = <OrderModel>[].obs;

  Future<void> resetOrderedProductId() async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('productId', '');
    prefs.setStringList('productIdList', []);
  }

  Future<void> setOrderedProductId(int id) async {
    final SharedPreferences prefs = await sharedPreference;
    prefs.setString('productId', id.toString());
  }

  Future<void> setOrderedProductIdList(List<int> productIdList) async {
    final SharedPreferences prefs = await sharedPreference;
    List<String> temp = productIdList.map((e) => e.toString()).toList();
    prefs.setStringList('productId', temp);
  }

  Future<void> addOrder() async {
    List<OrderDetailsModel> orderDetailsList=[];
    for (CartModel cart in overallController.customerInfo.value.cartList!) {
      OrderDetailsModel details = OrderDetailsModel(
        productPrice: cart.productPrice,
        productQuantity: cart.productQuantity,
        product: cart.product,
      );
      orderDetailsList.add(details);
    }

    await OrderService.addOrder(orderDetailsList);

    print(jsonEncode(orderDetailsList));

    await Future.delayed(const Duration(seconds: 5));
  }
  Future<void> fetchCustomerOrderByCustomer() async {
    orderList.clear();
    var result = await OrderService.getOrderFromCustomer();
    orderList.assignAll(result);
    await Future.delayed(const Duration(seconds: 5));
  }
}
