// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? success;
  String? message;
  Data? data;
  List<Post>? posts;

  UserModel({
    this.success,
    this.message,
    this.data,
    this.posts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Data {
  String? id;
  String? email;
  String? phone;
  String? username;
  int? v;
  bool? active;
  int? birthday;
  int? createdAt;
  String? password;
  String? token;
  int? lastLogin;
  String? photo;

  Data({
    this.id,
    this.email,
    this.phone,
    this.username,
    this.v,
    this.active,
    this.birthday,
    this.createdAt,
    this.password,
    this.token,
    this.lastLogin,
    this.photo,
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
        password: json["password"],
        token: json["token"],
        lastLogin: json["last_login"],
        photo: json["photo"],
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
        "password": password,
        "token": token,
        "last_login": lastLogin,
        "photo": photo,
      };
}

class Post {
  String? username;
  String? content;
  int? date;
  List<String>? images;
  List<String>? tags;
  List<String>? mentions;

  Post({
    this.username,
    this.content,
    this.date,
    this.images,
    this.tags,
    this.mentions,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        username: json["username"],
        content: json["content"],
        date: json["date"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        mentions: json["mentions"] == null
            ? []
            : List<String>.from(json["mentions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "content": content,
        "date": date,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "mentions":
            mentions == null ? [] : List<dynamic>.from(mentions!.map((x) => x)),
      };
}
