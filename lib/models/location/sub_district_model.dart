


class SubDistrictModel
{
  int? id;
  int? districtId;
  String? name;
  String? bnName;

  // "id": "1",
  // "district_id": "34",
  // "name": "Amtali",
  // "bn_name": "আমতলী"


  SubDistrictModel(this.id,this.districtId,this.name,this.bnName);

  SubDistrictModel.parseJson(Map<String,dynamic> json){
    id =  int.parse(json['id'])??0;
    districtId =  int.parse(json['district_id'])??0;
    name = json['name'];
    bnName = json['bn_name'];
  }
}