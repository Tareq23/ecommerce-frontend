import 'package:ecommercefrontend/models/product_model.dart';

class CategoryModel {
  int? id;
  String? title; // category name
  String? description;
  String? imageUrl;
  int? numberOfProduct;

  List<ProductModel>? products;

  CategoryModel(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.numberOfProduct,this.products});

  CategoryModel.addNew(this.title);

  CategoryModel.parseJsonForHomeProduct(Map<String, dynamic> json) {
    id = json['id'];
    title = json['name'];
    imageUrl = json['imageUrl'];
    // var _products = json['products']??[];

    var list = json['products'];
    // products = list.map((e) => ProductModel.parseJsonForCategory(e)).toList();
    products = toResponseList(json['products']);
    // print('-----------> ${json['products']}');
    // print('----------> category model _products length : ${_products.length}');
    // products = _products.map((e) {
    //   print('-------------> ${e}');
    //   return ProductModel.parseJsonForCategory(e);
    // }).toList();
    // products.assignAll(_products);
    // print('----------> category model products length : ${products!.length}');
  }
}

List<ProductModel> toResponseList(List<dynamic> data) {
  List<ProductModel> value = <ProductModel>[];
  data.forEach((element) {
    value.add(ProductModel.parseJsonForCategory(element));
  });
  print('----------> category model products length : ${value.length}');
  return value;
}

// List<Category> categoryList = [
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2017/08/01/13/36/computer-2565478__340.jpg',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2017/08/01/13/36/computer-2565478__340.jpg',numberOfProduct: 100),
// Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
// ];
