import 'package:flutter/material.dart';
import '/Other/extensions.dart';

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
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    Navigator.pushNamed(context, '/profile');
                  });
                }
              },
              style: Extensions.buttonStyleUsual1,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Login',
                    style: TextStyle(
                        color: Extensions.colorBright,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registration');
              },
              style: Extensions.buttonStyleUsual1,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Sign up',
                    style: TextStyle(
                        color: Extensions.colorBright,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
