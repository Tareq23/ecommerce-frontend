

import 'package:ecommercefrontend/models/product_model.dart';

class OrderModel {

  int? id;
  DateTime? date;
  String? status;
  List<ProductModel>? productList;


  OrderModel({this.id,this.date,this.status,this.productList});

  OrderModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    date = json['data'];
    status = json['status'];
    productList = json['products'].map((e) => ProductModel.parseOrder(e));
  }

}

List<OrderModel> orderList = [
OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
  ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
  ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Cancelled',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
OrderModel(id: 1,date: DateTime(2022,1,1),status: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')]),
];

