

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/home/product_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';

class CartModel{

  int? id;
  int? productQuantity=0;
  dynamic? productPrice;
  ProductModel? product;
  CartModel({this.id, this.product, this.productQuantity=1, this.productPrice});
  
  CartModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    product = ProductModel.parseJsonForProductDetails(json['product']);
  }

  CartModel.empty();

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "productQuantity" : productQuantity,
      "productPrice" : productPrice,
      "product" : productController.selectedProductForDetails.value,
    };
  }
}