



class DistrictModel
{
  // {
  // "id": "1",
  // "division_id": "3",
  // "name": "Dhaka",
  // "bn_name": "ঢাকা",
  // "lat": "23.7115253",
  // "long": "90.4111451"
  // },

  int? id;
  int? divisionId;
  String? name;
  String? bnName;

  DistrictModel(this.id,this.divisionId,this.name,this.bnName);

  DistrictModel.parseJson(Map<String,dynamic> json){
    id =  int.parse(json['id'])??0;
    divisionId =  int.parse(json['division_id'])??0;
    name = json['name'];
    bnName = json['bn_name'];
  }


}