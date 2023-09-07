import 'package:flutter/material.dart';
import 'package:modelss/components/loading_popup.dart';
import 'package:modelss/functions/date_parser.dart';
import 'package:modelss/loginPage/login_page.dart';
import 'package:modelss/riverpod/riverpod_management.dart';
import 'package:modelss/services/service.dart';
import 'package:grock/grock.dart';

class SignupRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController gender = TextEditingController();
  int? sex;
  late DateTime birthday;

  Future<void> fetchSignup(BuildContext context) async {
    debugPrint("fetchSignup çalıştı");
    loadingPopup();

    birthday = DateTime.now();
    var date = parseDate(birthday);
    debugPrint("date: $date");
    int unixTimestamp = birthday.millisecondsSinceEpoch ~/ 1000;
    debugPrint("unixTimestamp:  $unixTimestamp");
    String ipAddress = await getIp.returnIp();

    var result = await service.signupCall(
      username: username.text,
      email: email.text,
      phone: phone.text,
      password: password.text,
      birthday: date,
      ip: ipAddress,
      sex: int.tryParse(gender.text) ?? 0,
    );

    if (result?.success == true) {
      debugPrint("result ${result}");
      Grock.back();
      Grock.toRemove(const LoginPage());
    } else {
      Grock.back();
      Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
    }
  }
}
