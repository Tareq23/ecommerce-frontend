

class ProductModel
{
  int? id;
  String? title; // product name
  String? description;
  String? imageUrl;
  int? quantity;
  dynamic? price;
  dynamic? rating;
  ProductModel({this.id,this.title,this.quantity,this.description,this.imageUrl,this.price,this.rating});

  ProductModel.orderedProduct({required this.id,required this.title, required this.imageUrl,required this.quantity});

  ProductModel.parseOrder(Map<String,dynamic>product){
    id = product['productId'];
    title = product['productName'];
    imageUrl = product['imageUrl'];
  }

}

List<ProductModel> productList = [
  ProductModel(id: 1,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 85,rating: 100),
  ProductModel(id: 2,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 50,rating: 100),
  ProductModel(id: 3,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 232,rating: 100),
  ProductModel(id: 4,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 333,rating: 100),
  ProductModel(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
];