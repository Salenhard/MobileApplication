import 'package:flutter/material.dart';

import '../BackEnd/database/client_model.dart';
import '../BackEnd/database/database.dart';
import '../Other/extensions.dart';
import 'application.dart';

class Profile extends StatefulWidget {
  Client client;
  Profile(this.client, {super.key});
  @override
  State<StatefulWidget> createState() => ProfileState(client);
}

class ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  Client client;
  // SqliteService service = SqliteService();
  String name = "";
  int age = 0;
  String mail = "";
  String password = "";

  ProfileState(this.client);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Menu(),
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofillHints: Characters("Input Name here..."),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input Name";
                        }
                        if (!Extensions.validation(
                            value, RegExp(r'^[a-zA-Zа-яА-Я]+$'))) {
                          return "Invalid inputFieldText value";
                        } else {
                          name = value;
                        }
                      },
                      initialValue: client.name,
                      decoration:
                          Extensions.getTextFormFieldDecoration1("Name"),
                      style: const TextStyle(color: Extensions.colorSmooth2),
                      textAlignVertical: TextAlignVertical.center,
                    ))),
          ]),
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofillHints: Characters("Input Email here..."),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input Email";
                        }
                        if (!Extensions.validation(
                            value, RegExp(r'(.+)+(@)+(.{1})+(\.)+.+'))) {
                          return "Invalid inputFieldText value";
                        } else {
                          mail = value;
                        }
                      },
                      initialValue: client.mail,
                      decoration:
                          Extensions.getTextFormFieldDecoration1("Email"),
                      style: const TextStyle(color: Extensions.colorSmooth2),
                      textAlignVertical: TextAlignVertical.center,
                    ))),
          ]),
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofillHints: Characters("Input Password here..."),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input Password";
                        }
                        if (!Extensions.validation(
                            value,
                            RegExp(
                                r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$'))) {
                          return "Invalid inputFieldText value";
                        } else {
                          password = value;
                        }
                      },
                      initialValue: client.password,
                      decoration:
                          Extensions.getTextFormFieldDecoration1("password"),
                      style: const TextStyle(color: Extensions.colorSmooth2),
                      textAlignVertical: TextAlignVertical.center,
                    ))),
          ]),
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofillHints: Characters("Input Password here..."),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input Password";
                        }
                        if (!Extensions.validation(
                            value,
                            RegExp(
                                r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$'))) {
                          return "Invalid inputFieldText value";
                        } else {
                          password = value;
                        }
                      },
                      initialValue: client.password,
                      decoration:
                          Extensions.getTextFormFieldDecoration1("password"),
                      style: const TextStyle(color: Extensions.colorSmooth2),
                      textAlignVertical: TextAlignVertical.center,
                    ))),
          ]),
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofillHints: Characters("Input Age here..."),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input Age";
                        }
                        if (!Extensions.validation(value, RegExp(r'^\d+$'))) {
                          return "Invalid inputFieldText value";
                        } else {
                          age = int.parse(value);
                        }
                      },
                      initialValue: client.age.toString(),
                      decoration: Extensions.getTextFormFieldDecoration1("Age"),
                      style: const TextStyle(color: Extensions.colorSmooth2),
                      textAlignVertical: TextAlignVertical.center,
                    ))),
          ]),
          const SizedBox(height: 50.0),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() async {
                    Client newClient = Client(
                        id: client.id,
                        name: name,
                        mail: mail,
                        password: password,
                        age: age);
                    await DatabaseHelper.instance.update(newClient);
                  });
                }
              },
              style: Extensions.buttonStyleUsual1,
              child: const Text('Change',
                  style: TextStyle(color: Extensions.colorBright)))
        ]));
  }
}
