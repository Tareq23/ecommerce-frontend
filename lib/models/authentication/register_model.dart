

class RegisterModel
{
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? username;
  String? password;
  RegisterModel(this.firstName,this.lastName,this.username,this.phoneNumber,this.password);

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "username": username,
    "password": password,
  };
}