

import 'dart:async';

class RegisterModel
{
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? username;
  String? password;
  RegisterModel(this.firstName,this.lastName,this.username,this.phoneNumber,this.password);


  RegisterModel.parseJson(Map<String,dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    password = json['password'];
  }

  RegisterModel.empty();

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "username": username,
    "password": password,
  };
}