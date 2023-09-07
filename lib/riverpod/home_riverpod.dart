import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:modelss/components/loading_popup.dart';
import 'package:modelss/models/user_model.dart';
import 'package:modelss/screens/home_screen.dart';
import 'package:modelss/services/service.dart';

class HomeRiverpod extends ChangeNotifier {
  final service = Service();
  List<UserModel?> userDatas = [];
  bool isLoading = false;

  Future<UserModel?> getData() async {
    loadingPopup();
    isLoading = true;
    notifyListeners();

    try {
      UserModel? value = await service.userCall();
      if (value != null && value.success == true) {
        isLoading = false;
        userDatas = [value];
        Grock.back();
        return value;
      } else {
        isLoading = false;
        Grock.back();
        Grock.snackBar(
            title: "Hata", description: "Kullanıcı bilgileri çekilemedi");
        return null;
      }
    } catch (error) {
      isLoading = false;
      Grock.back();
      Grock.snackBar(title: "Hata", description: "Bir hata oluştu: $error");
    }
    notifyListeners();
    return null;
  }
}
