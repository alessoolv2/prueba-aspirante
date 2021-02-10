class LoginModel {
  LoginModel({this.user, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['email'];
    password = json['password'];
  }

  String user;
  String password;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = user;
    data['password'] = password;

    return data;
  }
}