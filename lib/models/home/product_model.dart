


import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';

class HomeProductModel
{
  int? id;
  String? name;
  dynamic? price;
  dynamic? regularPrice;
  dynamic? discountPrice;
  String? imageUrl;
  String? description;
  bool? isImageExists;
  bool? isImageChanged;
  int? categoryId;
  int? quantity;
  String? categoryName;
  String? categoryImageUrl;
  String? brandName;
  int? brandId;

  HomeProductModel(this.id,this.name,this.price,this.imageUrl,this.description);

  HomeProductModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    quantity = json['quantity']??0;
    regularPrice = json['regularPrice']??0;
    discountPrice = json['discountPrice']??0;
    imageUrl = json['imageUrl']??'';
    description = json['description']??'';
    print('----------> product regular price : ${json['regularPrice']}');
  }

  HomeProductModel.parseOrder(Map<String,dynamic>product){
    id = product['productId'];
    name = product['productName'];
    imageUrl = product['imageUrl'];
  }

  HomeProductModel.parseJsonWithCategoryAndBrand(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];

    regularPrice = json['regularPrice']??0;
    discountPrice = json['discountPrice']??0;
    quantity = json['quantity']??0;
    imageUrl = json['imageUrl'];
    description = json['description'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImageUrl = json['categoryImageUrl'];
    brandName = json['brandName'];
    brandId = json['brandId'];
    print('----------> product regular price : ${json['regularPrice']}');
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      'name' : name,
      'imageUrl' : imageUrl,
      'quantity' : quantity,
      'regularPrice' : regularPrice,
      'discountPrice' : discountPrice??0,
      'description' : description,
      'category' : categoryController.selectedCategory.value,
      'brand' : brandController.selectedBrand.value,
    };
  }

  HomeProductModel.empty();

}