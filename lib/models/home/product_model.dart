


import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';

class ProductModel
{
  int? id;
  String? name;
  dynamic? price;
  String? imageUrl;
  String? description;
  bool? isImageExists;
  bool? isImageChanged;
  ProductModel(this.id,this.name,this.price,this.imageUrl,this.description);

  ProductModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'imageUrl' : imageUrl,
      'price' : price,
      'description' : description,
      'category' : categoryController.selectedCategory.value,
    };
  }

  ProductModel.empty();

}