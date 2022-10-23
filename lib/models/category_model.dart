
class Category
{
  int? id;
  String? title; // category name
  String? description;
  String? imageUrl;
  int? numberOfProduct;
  Category({this.id,this.title,this.description,this.imageUrl,this.numberOfProduct});
}


List<Category> categoryList = [
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2017/08/01/13/36/computer-2565478__340.jpg',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2016/09/10/11/42/quadrocopter-1658967__340.png',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2017/08/01/13/36/computer-2565478__340.jpg',numberOfProduct: 100),
Category(id: 1,title: 'Category name',description: 'Category Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',numberOfProduct: 100),
];