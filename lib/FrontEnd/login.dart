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
          child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(30.0),
              child: const Text("Sign In",
                  style: TextStyle(
                      color: Extensions.colorBright,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 3.0)),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: MediaQuery.of(context).size.width * 0.15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Extensions.getTextFormFieldWithValidator(
                  "email",
                  RegExp(r'.+'),
                  Extensions.getTextFormFieldDecoration1("email")),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: MediaQuery.of(context).size.width * 0.15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Extensions.getTextFormFieldWithValidator(
                  "password",
                  RegExp(r'.+'),
                  Extensions.getTextFormFieldDecoration1("password")),
            ),
          ),

          // TODO: Space betwwen fields and buttons

          const SizedBox(
            height: 20,
          ),

          // TODO: Buttons in column

          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20),
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
            margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20),
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
