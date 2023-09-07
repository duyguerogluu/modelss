class LoginModel {
  bool? success;
  Data? data;
  String? token;

  LoginModel({this.success, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? phone;
  String? username;
  int? iV;
  bool? active;
  int? birthday;
  int? createdAt;
  String? password;
  String? token;
  int? lastLogin;
  String? photo;

  Data(
      {this.sId,
      this.email,
      this.phone,
      this.username,
      this.iV,
      this.active,
      this.birthday,
      this.createdAt,
      this.password,
      this.token,
      this.lastLogin,
      this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    iV = json['__v'];
    active = json['active'];
    birthday = json['birthday'];
    createdAt = json['createdAt'];
    password = json['password'];
    token = json['token'];
    lastLogin = json['last_login'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['__v'] = this.iV;
    data['active'] = this.active;
    data['birthday'] = this.birthday;
    data['createdAt'] = this.createdAt;
    data['password'] = this.password;
    data['token'] = this.token;
    data['last_login'] = this.lastLogin;
    data['photo'] = this.photo;
    return data;
  }
}
