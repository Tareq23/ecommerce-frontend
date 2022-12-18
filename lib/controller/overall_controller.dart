import 'dart:convert';
import 'dart:io';

import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/cart_model.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/customer_model.dart';
import 'package:ecommercefrontend/services/api/overall_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

class OverallController extends GetxController {
  static OverallController instance = Get.find();
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var currentWidgetWidth = 0.0.obs;
  var currentWidgetHeight = 0.0.obs;
  var activeWidgetIndex = 0.obs;

  var adminSideNavWidth = 0.0.obs;
  var adminSideNavHeight = 0.0.obs;
  var adminMainContentWidth = 0.0.obs;
  var adminMainContentHeight = 0.0.obs;

  var selectedImagePath = ''.obs;

  var selectedCategoryId = 0.obs;
  var selectedCategoryName = 'Categories'.obs;

  var isFetchedCategoryProduct = false.obs;
  var isDidChangeDependencies = false.obs;
  var isAddToCartAction = false.obs;
  var isOrderAction = false.obs;

  var selectDivisionName = 'Division'.obs;
  var selectDistrictName = 'District'.obs;
  var selectSubDistrictName = 'Sub District'.obs;
  var isValidatedAddressTextField = true.obs;
  var isDivisionChange = false.obs;
  var isDistrictChange = false.obs;
  var isSubDistrictChange = false.obs;

  var productQuantity = 1.obs;

  var customerInfo = CustomerModel.empty().obs;
  var setDefaultAddressId = 0.obs;
  var setOrderStatus = 0.obs;
  var customerDefaultAddress = AddressModel.empty().obs;

  var totalOrderPrice = 0.obs;
  var totalProductPrice = 0.obs;

  var categoryForCustomer = CategoryModel.empty().obs;

  var priceRangeFilterError = false.obs;
  var isPriceRangeFilterSearchAction = false.obs;


  Future<void> fetchUserInfo() async {
    var result = await OverallApiService.getUserInfo();
    customerInfo.value = result;
    for(AddressModel address in customerInfo.value.addressList!){
      if(address.isDefault!){
        customerDefaultAddress.value = address;
        break;
      }
    }
    dynamic price=0.0;
    for(CartModel cart in customerInfo.value.cartList!){
      price += double.parse(cart.productPrice!.toString());
    }
    totalProductPrice.value = price;
    totalOrderPrice.value = totalProductPrice.value+50;
    // print('cart product total price : ${totalOrderPrice.value}');
    // print('cart product length : ${jsonEncode(customerInfo.value.cartList)}');
  }


  Future<void> updateUserInfo(CustomerModel customer) async{
    var result = await OverallApiService.updateUserInfo(customer);
    customerInfo.value = result;
  }

}
