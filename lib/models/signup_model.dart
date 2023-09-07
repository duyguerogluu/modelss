// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  bool success;
  String message;
  Data data;

  SignupModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String email;
  String phone;
  String username;
  int v;
  bool active;
  int birthday;
  int createdAt;
  String ip;
  String password;
  String photo;
  int sex;

  Data({
    required this.id,
    required this.email,
    required this.phone,
    required this.username,
    required this.v,
    required this.active,
    required this.birthday,
    required this.createdAt,
    required this.ip,
    required this.password,
    required this.photo,
    required this.sex,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        v: json["__v"],
        active: json["active"],
        birthday: json["birthday"],
        createdAt: json["createdAt"],
        ip: json["ip"],
        password: json["password"],
        photo: json["photo"],
        sex: json["sex"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phone": phone,
        "username": username,
        "__v": v,
        "active": active,
        "birthday": birthday,
        "createdAt": createdAt,
        "ip": ip,
        "password": password,
        "photo": photo,
        "sex": sex,
      };
}
