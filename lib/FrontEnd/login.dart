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
          Container(
              padding: const EdgeInsets.all(50.0),
              child: const FittedBox(
                child: Text("Sign In",
                    style: TextStyle(
                        color: Extensions.colorBright,
                        fontWeight: FontWeight.bold),
                    textScaleFactor: 3.0),
              )),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: MediaQuery.of(context).size.width * 0.15),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextField(
                  style: const TextStyle(color: Extensions.colorSmooth2),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: Extensions.getTextFormFieldDecoration1("email"),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: MediaQuery.of(context).size.width * 0.15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                autocorrect: false,
                obscureText: true,
                style: const TextStyle(color: Extensions.colorSmooth2),
                textAlignVertical: TextAlignVertical.center,
                decoration: Extensions.getTextFormFieldDecoration1("password"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < list.length; i++) {
                      if (mail == list[i].mail) {
                        if (password == list[i].password) {
                          Navigator.pushNamed(context, '/profile');
                        } else {
                          // wrong password

                          return;
                        }
                      } else {
                        // wrong mail

                        return;
                      }
                    }
                    Navigator.pushNamed(context, '/profile');
                  },
                  style: Extensions.buttonStyleUsual1,
                  child: const Text('Log In',
                      style: TextStyle(color: Extensions.colorBright))),
              const SizedBox(height: 20.0),
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
