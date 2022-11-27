

class AddressModel{
  int? id;
  String? receiverName;
  String? phoneNumber;
  String? division;
  String? district;
  String? subDistrict;
  String? details;
  AddressModel({this.id,this.receiverName,this.phoneNumber,this.division,this.district,this.subDistrict});
  AddressModel.parseJson(Map<String,dynamic> json){
    id = json['id']??0;
    division = json['division']??'';
    district = json['district']??'';
    subDistrict = json['subDistrict']??'';
    details = json['details']??'';
    phoneNumber = json['phoneNumber']??'';
    receiverName = json['receiverName']??'';
  }
  AddressModel.empty();
}