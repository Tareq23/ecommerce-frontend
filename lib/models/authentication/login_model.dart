
class LoginModel{
  String? token;
  String? name;
  String? imageUrl;
  String? username;
  String? password;

  LoginModel(this.token,this.name,this.imageUrl);
  LoginModel.empty();

  LoginModel.parseJson(Map<String,dynamic> json)
  {
    token = json['token'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  // LoginModel.credential({required this.username,required this.password});
}

class CredentialModel
{
  String? username;
  String? password;
  CredentialModel(this.username,this.password);


  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };

  String? get getUsername => username;
  String? get getPassword => username;
}