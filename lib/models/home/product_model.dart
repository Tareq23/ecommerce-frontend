


import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';

class HomeProductModel
{
  int? id;
  String? name;
  dynamic? price;
  String? imageUrl;
  String? description;
  bool? isImageExists;
  bool? isImageChanged;
  int? categoryId;
  String? categoryName;
  String? categoryImageUrl;
  HomeProductModel(this.id,this.name,this.price,this.imageUrl,this.description);

  HomeProductModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

  HomeProductModel.parseOrder(Map<String,dynamic>product){
    id = product['productId'];
    name = product['productName'];
    imageUrl = product['imageUrl'];
  }

  HomeProductModel.parseJsonWithCategory(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImageUrl = json['categoryImageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'imageUrl' : imageUrl,
      'price' : price,
      'description' : description,
      'category' : categoryController.selectedCategory.value,
    };
  }

  HomeProductModel.empty();

}