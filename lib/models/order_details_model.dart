


import 'package:ecommercefrontend/models/product_model.dart';

class OrderDetailsModel{

  int? id;
  int? productQuantity=0;
  dynamic? productPrice;
  ProductModel? product;
  OrderDetailsModel({this.id, this.product, this.productQuantity=1, this.productPrice});

  OrderDetailsModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    product = ProductModel.parseJsonForProductDetails(json['product']);
  }

  Map<String,dynamic> toJson(){
    return {
      "productQuantity" : productQuantity,
      "productPrice" : productPrice,
      "product" : product,
    };
  }

}