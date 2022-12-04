

import 'package:ecommercefrontend/models/home/product_model.dart';

class HomeCategoryModel
{
  int? id;
  String? name;
  String? imageUrl;
  bool? isImageExists;
  bool? isImageChanged;
  // ProductModel? productModel;
  List<HomeProductModel>? productList;

  // CategoryModel(this.id,this.name,this.imageUrl,this.productList);
  HomeCategoryModel(this.id,this.name,this.imageUrl);
  HomeCategoryModel.empty();
  HomeCategoryModel.parseJsonAll(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    // productModel = ProductModel.parseJson(json['products']);
    var list = json['products']??[];
    productList = list.map((e) => HomeProductModel.parseJson(e)).toList();
  }


  HomeCategoryModel.parseJsonWithoutProduct(Map<String,dynamic>json){
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

  HomeCategoryModel.addNew({this.name});
  HomeCategoryModel.delete({this.id,this.name,this.imageUrl});
}