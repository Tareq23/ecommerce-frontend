
class LoginModel{
  String? token;
  String? name;
  String? imageUrl;
  String? username;
  String? password;
  bool? isAdmin;
  bool? isManager;
  bool? isCustomer;

  LoginModel(this.token,this.name,this.imageUrl,this.isAdmin,this.isManager,this.isCustomer);
  LoginModel.empty();

  LoginModel.parseJson(Map<String,dynamic> json){
    token = json['token'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    isAdmin = json['admin']??false;
    isManager = json['manager']??false;
    isCustomer = json['customer']??false;
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