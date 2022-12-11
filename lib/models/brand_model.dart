

class BrandModel
{
  int? id;
  String? name;
  String? slug;
  bool? isSelected;
  BrandModel(this.id,this.name,this.slug, this.isSelected);


  BrandModel.parseJson(Map<String, dynamic>json){
    id = json['id'];
    name = json['name'];
    slug = name?.split(" ").join("-");
  }


  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
    };
  }
  BrandModel.empty();
}

List<BrandModel> brandList = [
  BrandModel(1, 'hamim fashion', 'hamim-fashion',false),
  BrandModel(2, 'orbit tex', 'orbit-tex',false),
  BrandModel(3, 'hamim fashion', 'hamim-fashion',false),
  BrandModel(2, 'orbit tex', 'orbit-tex',false),
  BrandModel(4, 'hamim fashion', 'hamim-fashion',false),
];