import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:modelss/components/loading_popup.dart';
import 'package:modelss/screens/home_screen.dart';
import 'package:modelss/services/service.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController telNo = TextEditingController();
  TextEditingController passwprd = TextEditingController();
  final box = GetStorage();
  final token = GetStorage().read("token");

  void fetchLogin() {
    print("fetchLogin  çalıştı");
    loadingPopup();
    service.loginCall(telNo: telNo.text, password: passwprd.text).then((value) {
      if (value != null && value.success == true) {
        box.write("token", value.token);
        log(token);
        Grock.back();
        Grock.toRemove(const HomeScreen());
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
      }
    });
  }
}
