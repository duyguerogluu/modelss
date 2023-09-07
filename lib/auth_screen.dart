import 'package:flutter/material.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                prefixText: '+90',
                hintText: '  Telefon Numaranızı Giriniz',
                filled: true,
                alignLabelWithHint: true,
                labelText: 'Telefon Numaranızı Giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Flexible(
            child: TextFormField(
              autofocus: true,
              //controller: emailController,
              keyboardType: TextInputType.emailAddress,
              maxLength: 16,
              decoration: const InputDecoration(
                hintText: 'Email Giriniz',
                filled: true,
                alignLabelWithHint: true,
                labelText: 'Email Giriniz',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (!value!.contains('@') || !value.contains('com'))
                  return "Lütfen geçerli e-posta adresi giriniz.";
                return null;
              },
            ),
          ),
          Flexible(
            child: TextFormField(
              autofocus: true,
              obscureText: false,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                // prefixText: '+90',
                hintText: 'Kullanıcı Adı',
                filled: true,
                alignLabelWithHint: true,
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Flexible(
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                //prefixText: '+90',
                hintText: 'Şifre',
                filled: true,
                alignLabelWithHint: true,
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Flexible(
            child: TextFormField(
              obscuringCharacter: '•',
              autofocus: true,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                // prefixText: '+90',
                hintText: ' Şifre Doğrula',
                filled: true,
                alignLabelWithHint: true,
                labelText: 'Şifre Doğrula',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
