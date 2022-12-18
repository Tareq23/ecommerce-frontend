import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/cart_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/services/api/cart_api_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  static CartController instance = Get.find();

  var cart = CartModel.empty().obs;
  var cartList = <CartModel>[].obs;
  var isDeletedCart = false.obs;

  Future<void> addCart(ProductModel product) async{
    cart.value.productQuantity = overallController.productQuantity.value;
    cart.value.product = product;
    if(productController.selectedProductForDetails.value.discountPrice>0){
      cart.value.productPrice = cart.value.productQuantity! * productController.selectedProductForDetails.value.discountPrice!;
    }
    else{
      cart.value.productPrice = cart.value.productQuantity! * productController.selectedProductForDetails.value.regularPrice!;
    }

    // print(jsonEncode(cart));

     await CartService.addCart(cart.value);
    // overallController.isAddToCartAction.value = false;
  }
  Future<void> deleteCart(CartModel cart) async{

    var result = await CartService.delete(cart);
    isDeletedCart.value = result;
    if(result){
      await overallController.fetchUserInfo();
    }
  }

}