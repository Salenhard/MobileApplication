import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/database.dart';
import '../BackEnd/database/client_model.dart';
import '/Other/extensions.dart';

class Login extends StatefulWidget {
  final List<Client> list;
  const Login(this.list, {super.key});

  @override
  State<StatefulWidget> createState() => LoginState(list);
}

class LoginState extends State<Login> {
  final List<Client> list;
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";

  LoginState(this.list);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: <Widget>[
          Expanded(
          child: Container(
              padding: const EdgeInsets.all(10.0),
          child:
          TextFormField(
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
            decoration: Extensions.getTextFormFieldDecoration1("Email"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ))),
          ]),

          Row(children: <Widget>[
          Expanded(
          child: Container(
              padding: const EdgeInsets.all(10.0),
          child:
          TextFormField(
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
            decoration: Extensions.getTextFormFieldDecoration1("password"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ))),
          ]),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      for (int i = 0; i < list.length; i++) {
                        if (mail == list[i].mail &&
                            password == list[i].password) {
                          Navigator.pushNamed(context, '/weather');
                        }
                      }
                    }
                  },
                  style: Extensions.buttonStyleUsual1,
                  child: const Text('Log In',
                      style: TextStyle(color: Extensions.colorBright))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  style: Extensions.buttonStyleUsual1,
                  child: const Text('Registration',
                      style: TextStyle(color: Extensions.colorBright)))
            ]),
          )
        ],
      )),
    );
  }
}
