import 'package:flutter/material.dart';
import 'package:modelss/functions/date_parser.dart';
import 'package:modelss/loginPage/confirm_password.dart';
import 'package:modelss/loginPage/password_fields.dart';
import 'package:modelss/loginPage/signup_button.dart';
import 'package:modelss/riverpod/getIp_riverpod.dart';
import 'package:modelss/riverpod/riverpod_management.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _ishidden = true;
  bool isProcessing = false;
  List<int> _genders = [0, 1];

  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentValue = _genders[0];
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
                            controller: signup.username,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "UserName",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(4.0),
                        //   decoration: BoxDecoration(
                        //     border: Border(
                        //       bottom: BorderSide(
                        //         color: Colors.grey.shade200,
                        //       ),
                        //     ),
                        //   ),
                        //   child: TextFormField(
                        //     controller: signup.,
                        //     cursorColor: Colors.purpleAccent,
                        //     style: const TextStyle(
                        //         color: Color.fromRGBO(143, 148, 251, 1)),
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       hintText: "Last Name",
                        //       hintStyle: TextStyle(color: Colors.grey[400]),
                        //     ),
                        //   ),
                        // ),
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
                            controller: signup.email,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.purpleAccent,
                            style: const TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email address",
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
                              controller: signup.password,
                              cursorColor: Colors.purpleAccent,
                              obscureText: _ishidden ? true : false,
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(_ishidden
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: _toggleVisibility,
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            )),
                        //ConfirmPassword(),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  child: Icon(Icons.calendar_today),
                                  onTap: () async {
                                    const minAge = 18;
                                    final now = DateTime.now();
                                    final eighteen =
                                        DateTime(now.year - minAge);
                                    final last =
                                        DateTime(eighteen.year, 12, 31);
                                    final datePick = await showDatePicker(
                                        context: context,
                                        initialDate: eighteen,
                                        firstDate: DateTime(1900),
                                        lastDate: last);
                                    if (datePick != null) {
                                      setState(() {
                                        birthDate = datePick;
                                        isDateSelected = true;
                                        birthDateInString = parseDate(datePick);
                                        debugPrint(birthDateInString);
                                      });
                                    }
                                  }),
                              Text(birthDateInString ?? "-/-/-"),
                            ],
                          ),
                        )
                      ],
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
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Female"),
                          leading: Radio(
                            groupValue: currentValue,
                            value: _genders[0],
                            onChanged: (value) {
                              setState(() {
                                currentValue = _genders[0];
                                signup.sex = currentValue;
                                debugPrint("Current value: " +
                                    currentValue.toString());
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text("Male"),
                          leading: Radio(
                            groupValue: currentValue,
                            value: _genders[1],
                            onChanged: (value) {
                              setState(() {
                                currentValue = _genders[1];
                                signup.sex = currentValue;
                                debugPrint("Current value: " +
                                    currentValue.toString());
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            //SignupButton(),
            Container(
              height: 100,
              width: 200,
              child: ElevatedButton(
                onPressed: isProcessing
                    ? null
                    : () async {
                        setState(() {
                          isProcessing = true;
                        });
                        await signup.fetchSignup(context);
                        setState(() {
                          isProcessing = false;
                        });
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
