import 'package:flutter/material.dart';

class Loginecoration extends StatelessWidget {
  const Loginecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  "Logo",
                  style: TextStyle(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
