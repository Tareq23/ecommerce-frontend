


class ProductModel
{
  int? id;
  String? name;
  dynamic? price;
  String? imageUrl;
  String? description;
  ProductModel(this.id,this.name,this.price,this.imageUrl,this.description);

  ProductModel.parseJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

}