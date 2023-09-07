import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                Color.fromRGBO(95, 68, 171, 0.1),
                Colors.transparent,
              ],
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: const Center(
            child: Text(
              "Kaydol",
              style: TextStyle(
                color: Color.fromRGBO(95, 68, 171, 0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
