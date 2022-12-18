

import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/order_details_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';

class OrderModel {

  int? id;
  String? date;
  String? orderStatus;
  String? paymentStatus;
  List<ProductModel>? productList = [];
  List<OrderDetailsModel>? orderDetailsList = [];
  AddressModel? address;
  String? username='';
  String? phoneNumber='';


  OrderModel({this.id,this.date,this.orderStatus,this.productList});

  OrderModel.withAddress({this.id,this.date,this.orderStatus,this.productList,this.address,this.orderDetailsList});



  OrderModel.parseJson(Map<String,dynamic>json){
    id = json['id']??0;
    date = json['createdAt']??DateTime.now().toString();
    orderStatus = json['orderStatus']??'nothing';
    paymentStatus = json['paymentStatus']??'nothing';
    var details = json['details'] as List;
    orderDetailsList = details.map((e)=>OrderDetailsModel.parseJson(e)).toList();
    address = AddressModel.parseJson(json['address']);
  }

  OrderModel.parseJsonForSingleOrderByAdmin(Map<String,dynamic>json){
    username = '${json['firstName']} ${json['lastName']}';
    phoneNumber = json['phoneNumber'];
    id = json['order']['id']??0;
    date = json['order']['createdAt']??DateTime.now().toString();
    orderStatus = json['order']['orderStatus']??'nothing';
    paymentStatus = json['order']['paymentStatus']??'nothing';
    var details = json['order']['details'] as List;
    orderDetailsList = details.map((e)=>OrderDetailsModel.parseJson(e)).toList();
    address = AddressModel.parseJson(json['order']['address']);
  }

  OrderModel.empty();

  Map<String,dynamic> toJson(){
    return {
      "id" : id,
      "orderStatus" : orderStatus,
      "paymentStatus" : paymentStatus
    };
  }

}



// List<OrderModel> orderList = [
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
//   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
//   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// ];

