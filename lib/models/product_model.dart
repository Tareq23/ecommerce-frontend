

class Product
{
  int? id;
  String? title; // product name
  String? description;
  String? imageUrl;
  dynamic? price;
  dynamic? rating;
  Product({this.id,this.title,this.description,this.imageUrl,this.price,this.rating});
}

List<Product> productList = [
  Product(id: 1,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 85,rating: 100),
  Product(id: 2,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 50,rating: 100),
  Product(id: 3,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 232,rating: 100),
  Product(id: 4,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 333,rating: 100),
  Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
  // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
];