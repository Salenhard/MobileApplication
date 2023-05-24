import 'package:flutter/material.dart';

import '../BackEnd/database/client_model.dart';
import '../BackEnd/database/database.dart';
// import 'extensions.dart';

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

          // Extensions.packageWidgetsAsRow(
          //     Extensions.buildExtendedInputFieldAsList(
          //         "Email", RegExp(r'(.+)+(@)+(.{1})+(\.)+.+'))),

          // Extensions.packageWidgetsAsRow(
          //     Extensions.buildExtendedInputFieldAsList(
          //         "Password",
          //         RegExp(
          //             r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$'))),

          // Extensions.packageWidgetsAsRow(
          //     Extensions.buildExtendedInputFieldAsList(
          //         "Confirm the password", RegExp(r'.+'))),

          // Extensions.packageWidgetsAsRow(
          //     Extensions.buildExtendedInputFieldAsList(
          //         "Name", RegExp(r'^[a-zA-Zа-яА-Я]+$'))),

          // Extensions.packageWidgetsAsRow(
          //     Extensions.buildExtendedInputFieldAsList(
          //         "Age", RegExp(r'^\d+$'))),
          // const SizedBox(height: 50.0),

          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Client client = Client(name: name, mail: mail, password: password, age: age);
                  // await DBProvider.db.newClient(client);
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
