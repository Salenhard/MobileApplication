import 'package:flutter/material.dart';
import '/Other/extensions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";

  LoginState();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(

            // TODO: Center buttons alignment

            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
                children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                  // color: Colors.amber,
                  child: const Text("Hello there.",
                      style: TextStyle(
                          color: Extensions.colorBright,
                          fontWeight: FontWeight.bold),
                      textScaleFactor: 5),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: TextField(
                  key: const Key("inputMail"),
                  style: const TextStyle(color: Extensions.colorSmooth2),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: Extensions.getTextFormFieldDecoration1("email"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: TextField(
                  autocorrect: false,
                  obscureText: true,
                  style: const TextStyle(color: Extensions.colorSmooth2),
                  textAlignVertical: TextAlignVertical.center,
                  decoration:
                      Extensions.getTextFormFieldDecoration1("password"),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        style: Extensions.buttonStyleUsual1,
                        child: const Text('Log In',
                            style: TextStyle(color: Extensions.colorBright))),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        style: Extensions.buttonStyleUsual1,
                        child: const Text('Sign Up',
                            style: TextStyle(color: Extensions.colorBright))),
                  ],
                ),
              ),

              /*

        Column(
        children: [
          const Expanded(
              child: FittedBox(
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
                      if (mail == list[i].mail &&
                          password == list[i].password) {
                        Navigator.pushNamed(context, '/profile');
                      } else {
                        // wrong
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
      )

        */
            ])));
  }
}
