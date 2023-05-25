import 'package:flutter/material.dart';

import '../BackEnd/database/client_model.dart';
import '../BackEnd/database/database.dart';
import '../Other/extensions.dart';


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
          const SizedBox(height: 10.0),

          Extensions.packageWidgetsAsRow(
              [Extensions.getTextFormFieldWithValidator(
                  "Email", RegExp(r'(.+)+(@)+(.{1})+(\.)+.+'), Extensions.getTextFormFieldDecoration1("Email"))]),

          Extensions.packageWidgetsAsRow(
              [Extensions.getTextFormFieldWithValidator(
                  "Password",
                  RegExp(
                      r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$'), Extensions.getTextFormFieldDecoration1("password"))]),

          Extensions.packageWidgetsAsRow(
              [Extensions.getTextFormFieldWithValidator(
                  "Confirm the password", RegExp(r'.+'), Extensions.getTextFormFieldDecoration1("password"))]),

          Extensions.packageWidgetsAsRow(
              [Extensions.getTextFormFieldWithValidator(
                  "Name", RegExp(r'^[a-zA-Zа-яА-Я]+$'), Extensions.getTextFormFieldDecoration1("name"))]),

          Extensions.packageWidgetsAsRow(
              [Extensions.getTextFormFieldWithValidator(
                  "Age", RegExp(r'^\d+$'), Extensions.getTextFormFieldDecoration1("Age"))]),
          const SizedBox(height: 50.0),

          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Client client = Client(name: name, mail: mail, password: password, age: age);
                  // await DatabaseHelper.instance.add(client);
                  //
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
