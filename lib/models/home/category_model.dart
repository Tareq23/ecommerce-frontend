

import 'package:ecommercefrontend/models/home/product_model.dart';

class CategoryModel
{
  int? id;
  String? name;
  String? imageUrl;
  bool? isImageExists;
  bool? isImageChanged;
  // ProductModel? productModel;
  List<HomeProductModel>? productList;

  // CategoryModel(this.id,this.name,this.imageUrl,this.productList);
  CategoryModel(this.id,this.name,this.imageUrl);
  CategoryModel.empty();
  CategoryModel.parseJsonAll(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    // productModel = ProductModel.parseJson(json['products']);
    var list = json['products']??[];
    productList = list.map((e) => HomeProductModel.parseJson(e)).toList();
  }


  CategoryModel.parseJsonWithoutProduct(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'id' : id,
      'imageUrl' : imageUrl,
      'isImageChanged' : isImageChanged??false,
      'isImageExists' : isImageExists??false,
    };
  }

  CategoryModel.addNew({this.name});
  CategoryModel.delete({this.id,this.name,this.imageUrl});
}