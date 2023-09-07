import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: _ishidden ? true : false,
        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(_ishidden ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggleVisibility,
          ),
          border: InputBorder.none,
          hintText: "Confirm Password",
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
