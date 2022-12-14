

class AddressModel{
  int? id;
  String? receiverName;
  String? phoneNumber;
  String? division;
  String? district;
  String? subDistrict;
  String? details;
  bool? isDefault;
  String? address;
  String? email;
  AddressModel({this.id,this.receiverName,this.phoneNumber,this.division,this.district,this.subDistrict});
  AddressModel.parseJson(Map<String,dynamic> json){
    id = json['id']??0;
    isDefault = json['currentAddress']??false;
    division = json['division']??'';
    district = json['district']??'';
    subDistrict = json['subDistrict']??'';
    details = json['details']??'';
    phoneNumber = json['phoneNumber']??'';
    receiverName = json['name']??'';
    email = json['email']??'';
    address = '$division বিভাগ, জেলা-$district, উপজেলা- $subDistrict';
    // print('${json['division']} address model ----------> $address');
  }
  AddressModel.empty({this.isDefault=false});


  Map<String, dynamic> toJson(){
    return {
      "name" : receiverName,
      "email" : email,
      "phoneNumber" : phoneNumber,
      "division" : division,
      "district" : district,
      "subDistrict" : subDistrict,
      "details" : details,
      "currentAddress" : isDefault,
    };
  }
}