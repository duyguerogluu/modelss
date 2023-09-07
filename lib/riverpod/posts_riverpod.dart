import 'package:flutter/material.dart';

class PostsRiverpod extends ChangeNotifier {
  int likeValue = 0;

  likesNumber(int value) {
    likeValue = likeValue + 1;
    debugPrint("beğeni sayısı $likeValue");
    return likeValue;
  }
}
