import 'package:flutter/material.dart';
import 'package:modelss/riverpod/riverpod_management.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({super.key});

  @override
  State<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, .2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          minLines: 4,
                          controller: postCreate.content,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.purpleAccent,
                          style: const TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "açıklama",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        child: TextFormField(
                          controller: signup.phone,
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.purpleAccent,
                          style: const TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
