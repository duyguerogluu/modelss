import 'package:flutter/material.dart';

class BirthdayRiverpod extends ChangeNotifier {
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime? birthDate;
  String? birthDateInString;
  Future<String?> birthdayFetch(BuildContext context) async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != birthDate) {
      birthDate = datePick;
      isDateSelected = true;
      birthDateInString =
          "${birthDate?.day}.${birthDate?.month}.${birthDate?.year}";
      debugPrint(birthDateInString);
      return birthDateInString;
    }
  }

  Future<String> bday(BuildContext context) async {
    String? bdayString = await birthdayFetch(context);
    debugPrint("bdayString" + bdayString!);
    return bdayString;
  }
}
