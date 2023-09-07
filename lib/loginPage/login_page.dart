import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:modelss/loginPage/signup_page.dart';
import 'package:modelss/riverpod/riverpod_management.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _pageLogin = true;

  void _togglePage(bool _switchme) {
    setState(
      () {
        _pageLogin = _switchme;
      },
    );
  }

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: Grock.deviceHeight * 0.1,
                    child: Image.network(
                        "https://logomaker.designfreelogoonline.com/media/productdesigner/logo/resized/1286_bird-01.png"),
                  ),
                ),
                //buttonlarım
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        _togglePage(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _pageLogin
                            ? const Color.fromRGBO(143, 148, 251, 1)
                            : Colors.transparent,
                        primary: Colors.transparent,
                        onPrimary: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: _pageLogin
                              ? Colors.white
                              : Color.fromARGB(255, 217, 217, 217),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    //register buttton
                    ElevatedButton(
                      onPressed: () {
                        _togglePage(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _pageLogin
                            ? Colors.transparent
                            : Color.fromRGBO(143, 148, 251, 1),
                        primary: Colors.transparent,
                        onPrimary: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18,
                            color: _pageLogin
                                ? const Color.fromARGB(255, 217, 217, 217)
                                : Colors.white),
                      ),
                    ),
                  ],
                ),
                _pageLogin
                    //login page im
                    ? Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
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
                                  //Username gircem
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: login.telNo,
                                      cursorColor: Colors.purpleAccent,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1)),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ),
                                  ),

                                  //password gircem
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: login.passwprd,
                                      cursorColor: Colors.purpleAccent,
                                      obscureText: _ishidden ? true : false,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1)),
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
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  login.fetchLogin();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _pageLogin
                                      ? const Color.fromRGBO(143, 148, 251, 1)
                                      : Colors.transparent,
                                  primary: Colors.transparent,
                                  onPrimary: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Giriş Yap',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: _pageLogin
                                        ? Colors.white
                                        : Color.fromARGB(255, 217, 217, 217),
                                  ),
                                ),
                              ),
                            ),

                            //Şifremi Unuttum
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: InkWell(
                                child: const Text(
                                  'Şifremi Unuttum',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(143, 148, 251, 1),
                                    fontSize: 16,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      )
                    : SignupPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
