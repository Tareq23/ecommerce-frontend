

import 'package:ecommercefrontend/models/home/product_model.dart';

class CategoryModel
{
  int? id;
  String? name;
  String? imageUrl;
  // ProductModel? productModel;
  List<ProductModel>? productList;

  CategoryModel(this.id,this.name,this.imageUrl,this.productList);
  CategoryModel.empty();
  CategoryModel.parseJsonAll(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    // productModel = ProductModel.parseJson(json['products']);
    var list = json['products']??[] as List;
    productList = list.map((e) => ProductModel.parseJson(e)).toList();
  }


  CategoryModel.parseJsonWithoutProduct(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }
}