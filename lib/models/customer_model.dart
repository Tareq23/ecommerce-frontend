

import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/cart_model.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/models/review_model.dart';

class CustomerModel{
  int? id;
  String? name='';
  String? email='';
  String? firstName='';
  String? lastName='';
  String? phoneNumber='';
  String? username='';
  String? dateOfBirth='';

  List<AddressModel>? addressList;
  List<CartModel>? cartList;
  // List<ContactModel> cantactList;
  List<OrderModel>? orderList;
  List<ReviewModel>? reviewList;

  CustomerModel({this.name,this.email,this.phoneNumber,this.addressList,this.cartList,this.orderList,this.reviewList});

  CustomerModel.parseJson(Map<String, dynamic> json){
    id = json['id'];
    name = "${json['firstName']} ${json['lastName']}";
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    dateOfBirth = json['dateOfBirth']??'';
    // print(phoneNumber);
    var addresses = json['addresses'] as List;
    // print(addresses);
    // addressList!.addAll(addresses.map((e) => AddressModel.parseJson(e)));
    addressList = addresses.map((e) => AddressModel.parseJson(e)).toList();
    print(addresses.length);
    var carts = json['carts'] as List;
    cartList = carts.map((e) => CartModel.parseJson(e)).toList();
    // print('cartList.length      ------>  ${cartList!.length}');

    var orders = json['orders'] as List;
    orderList = orders.map((e) => OrderModel.parseJson(e)).toList();
    // print('orderList.length      ------>  ${orderList!.length}');

    var review = json['review'] as List;
    reviewList = review.map((e) => ReviewModel.parseJson(e)).toList();
    print('reviewList.length      ------>  ${reviewList!.length}');
  }

  Map<String,dynamic> toJson(){
    return {
      "username" : username,
      "firstName" : firstName,
      "lastName" : lastName,
      "phoneNumber" : phoneNumber,
      "dateOfBirth" : dateOfBirth,
    };
  }

  CustomerModel.empty();

}