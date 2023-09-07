import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modelss/riverpod/riverpod_management.dart';

Widget postCard() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd.MM.yyyy').format(now);
  String formattedTime = DateFormat('HH').format(now);
  int value = 0;
  //String formattedTime = DateFormat('HH:mm:ss').format(now);
  return Card(
      color: Colors.white,
      elevation: 50,
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            Text("$formattedTime"),
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqpYrRhr6UNCfR4_zVukpkcpXdSevlX_trSeI5HbyO&s" ??
                    ""),
            IconButton(
              onPressed: () {
                posts.likesNumber(value);
              },
              icon: const Icon(Icons.thumb_up),
            ),
          ],
        ),
      ));
}
