

class DivisionModel{

  int? id;
  String? name;
  String? bnName;

  DivisionModel(this.id,this.name,this.bnName);


  DivisionModel.parseJson(Map<String,dynamic> json){
    id = int.parse(json['id'])??0;
    name = json['name'];
    bnName = json['bn_name'];
  }

}