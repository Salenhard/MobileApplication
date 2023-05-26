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

  final _mailTEC = TextEditingController();
  final _passwordTEC = TextEditingController();

  var _isSomeFieldIsEmpty = false;
  var _isInputsIsWrong = false;

  LoginState();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
          // Title

          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
              // color: Colors.amber,
              child: const Text("Hello there.",
                  style: TextStyle(
                      color: Extensions.colorBright,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 5),
            ),
          ),

          // Inputs

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: TextField(
                  controller: _mailTEC,
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
                  controller: _passwordTEC,
                  autocorrect: false,
                  obscureText: true,
                  style: const TextStyle(color: Extensions.colorSmooth2),
                  textAlignVertical: TextAlignVertical.center,
                  decoration:
                      Extensions.getTextFormFieldDecoration1("password"),
                ),
              )
            ],
          ),

          // Warnings

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                child: Visibility(
                  visible: _isSomeFieldIsEmpty,
                  child: const Text(
                    "Input email and\\or password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Visibility(
                  visible: _isInputsIsWrong,
                  child: const Text(
                    "Wrong email and\\or password",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),

          // Buttons

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_mailTEC.text.isEmpty ||
                            _passwordTEC.text.isEmpty) {
                          setState(() {
                            _isSomeFieldIsEmpty = true;
                          });
                          return;
                        }
                        setState(() {
                          _isSomeFieldIsEmpty = false;
                        });

                        Navigator.pushNamed(context, '/profile');
                      },
                      style: Extensions.buttonElevatedStyleUsual1,
                      child: const Text('Log In',
                          style: TextStyle(color: Extensions.colorBright))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      style: Extensions.buttonElevatedStyleUsual2,
                      child: const Text('Sign Up',
                          style: TextStyle(color: Extensions.colorBright))),
                )
              ],
            ),
          ),
        ]));
  }
}
