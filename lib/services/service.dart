import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:modelss/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:modelss/models/signup_model.dart';
import 'package:modelss/models/user_model.dart';
import 'package:modelss/riverpod/birthday_riverpod.dart';
import 'package:modelss/riverpod/riverpod_management.dart';
import 'package:modelss/url/url.dart';

class Service {
  //Login
  Future<LoginModel?> loginCall(
      {required String telNo, required String password}) async {
    Map<String, String> jsonData = {
      "login": telNo,
      "password": password,
    };

    var response = await http.post(Uri.parse(baseUrl + "/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonData));

    if (response.statusCode == 200) {
      var result = LoginModel.fromJson(jsonDecode(response.body));
      log("Gelen Response: ${response.body}");
      return result;
    } else {
      throw ('Failed to login ${response.statusCode}');
    }
  }

  // Usercall
  Future<UserModel?> userCall() async {
    String token = await GetStorage().read("token");

    Map<String, dynamic> jsonData = {
      "success": "true",
      "message": "Başarıyla @acarfx kullanıcısının bilgileri okundu.",
      "data": {
        "_id": "64da9708de6cc47d8e70b770",
        "email": "acar.se0666@gmail.com",
        "phone": "5013530006",
        "username": "acarfx",
        "__v": 0,
        "active": true,
        "birthday": 1001970000,
        "createdAt": 1692047112700,
        "password": "123456",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFjYXJmeCIsInBhc3N3b3JkIjoiMTIzNDU2IiwiaWF0IjoxNjkyMDQ3MTM0fQ.ppuUU8eTHyszendqtE_nGdtfojPXV0fdg_TIAbrV_7g",
        "last_login": 1692614755837,
        "photo": "94e13eef-0507-44a4-ab3a-6db3a3bfa0da.gif"
      },
      "posts": [
        {
          "username": "acarfx",
          "content": "only modern java",
          "date": 1692614743646
        },
        {
          "username": "acarfx",
          "content": "#ictimSarabiDiririirin Veriyom Yaraği @acarfx",
          "images": ["b264773d-e4ac-4a09-b17d-0b88f9c5a0e8.jpg"],
          "tags": ["#ictimSarabiDiririirin"],
          "mentions": ["acarfx"],
          "date": 1692361489728
        }
      ]
    };

    var response = await http.post(Uri.parse(baseUrl + "/user"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
        body: jsonEncode(jsonData));

    debugPrint("Response Status Code userCall: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      final userModel = userModelFromJson(response.body);
      log("Gelen Response: ${response.body}");
      return userModel;
    } else {
      throw ('Failed to login ${response.statusCode}');
    }
  }

  //Singup
  Future<SignupModel?> signupCall({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String birthday,
    required int sex,
    required String ip,
  }) async {
    var user = 'your_proxy_username';
    var pass = 'your_proxy_password';
    var basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$pass'));

    String ipAddress = await getIp.returnIp();

    Map<String, dynamic> jsonData = {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "birthday": birthday,
      "sex": sex,
      "ip": ipAddress,
    };

    debugPrint("AUTH: $basicAuth");

    var response = await http.post(
      Uri.parse(baseUrl + "/signup"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body: jsonEncode(jsonData),
    );
    if (response.statusCode == 200) {
      debugPrint("Response Body: ${response.body}");
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      debugPrint("Kayıt okey");
      final signupModel = signupModelFromJson(response.body);
      return signupModel; //jsonDecode(response.body);
    } else {
      debugPrint("Response Status Code signupCall: ${response.statusCode}");
      return null;
    }
  }

  //Post
  Future<void> postCall({
    required String content,
    required String imageUrl,
  }) async {
    String token = await GetStorage().read("token");
    Map<String, String> jsonData = {
      "content": content,
      "imageUrl": imageUrl,
    };

    var response = await http.post(
      Uri.parse(baseUrl + "/post/create"),
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Basic ' + token,
      },
      body: jsonData,
    );

    debugPrint("Response Status Code postCreateCall ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      log("Gelen Response: ${response.body}");
      debugPrint("Response Status Code userCall: ${response.statusCode}");
    } else {
      throw ('Failed to login ${response.statusCode}');
    }
  }
}
