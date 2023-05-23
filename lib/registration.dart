import 'package:flutter/material.dart';

import 'extencions.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<StatefulWidget> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          // const SizedBox(height: 10.0),

          Extensions.BuildExtendedInputFieldAsRow(
              "Email", RegExp(r'(.+)+(@)+(.{1})+(\.)+.+')),

          Extensions.BuildExtendedInputFieldAsRow("Password",
              RegExp(r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$')),

          Extensions.BuildExtendedInputFieldAsRow("Confirm the password",
              RegExp(r'.+')),

          Extensions.BuildExtendedInputFieldAsRow(
              "Name", RegExp(r'^[a-zA-Zа-яА-Я]+$')),

          Extensions.BuildExtendedInputFieldAsRow("Age", RegExp(r'^\d+$')),
          // const SizedBox(height: 50.0),

          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('Регистрация')),
          const SizedBox(height: 50.0),
        ]));
  }
}
