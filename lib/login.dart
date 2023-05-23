import 'package:flutter/material.dart';

import 'extencions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  //RegExp exp = RegExp();
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Extensions.BuildExtendedInputFieldAsRow("Email", RegExp(r'.+')),
          Extensions.BuildExtendedInputFieldAsRow("Password", RegExp(r'.+')),
          // const SizedBox(height: 10.0),

          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                      Navigator.pushNamed(context, '/profile');
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('Вход')),

          const SizedBox(height: 50.0),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('Регистрация')),
          const SizedBox(height: 50.0),
        ]));
  }
}
