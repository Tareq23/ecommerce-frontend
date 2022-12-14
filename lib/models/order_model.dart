

import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/order_details_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';

class OrderModel {

  int? id;
  String? date;
  String? status;
  List<ProductModel>? productList;
  List<OrderDetailsModel>? orderDetailsList;
  AddressModel? address;


  OrderModel({this.id,this.date,this.status,this.productList});

  OrderModel.withAddress({this.id,this.date,this.status,this.productList,this.address,this.orderDetailsList});



  OrderModel.parseJson(Map<String,dynamic>json){
    id = json['id']??0;
    date = json['createdAt']??'';
    status = json['orderStatus']??'pending';
    var details = json['details'] as List;
    orderDetailsList = details.map((e)=>OrderDetailsModel.parseJson(e)).toList();
    // address =
  }

  OrderModel.empty();

}



// List<OrderModel> orderList = [
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
//   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
//   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
// ];

