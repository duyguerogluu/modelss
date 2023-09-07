import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:modelss/components/loading_popup.dart';
import 'package:modelss/loginPage/login_page.dart';
import 'package:modelss/screens/home_screen.dart';
import 'package:modelss/services/service.dart';

class PostCreateRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController content = TextEditingController();
  late String imageUrl;

  Future<void> fetchPostCreate(BuildContext context) async {
    debugPrint("fetchPostCreate çalıştı");
    loadingPopup();

    var result = await service.postCall(
      content: content.text,
      imageUrl: imageUrl ??
          "https://www.eclosio.ong/wp-content/uploads/2018/08/default.png",
    );
    Grock.back();
    Grock.toRemove(const HomeScreen());
  }
}
