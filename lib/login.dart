import 'package:flutter/material.dart';
import 'extensions.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(20.0),
              child: const Text("Log In",
                  style: TextStyle(
                      color: Extensions.colorBright,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 3.0)),

          // TODO: Change containers to table
          // Link: https://api.flutter.dev/flutter/widgets/Table-class.html

          Extensions.getExtendedInputFieldAsContainer("Email", RegExp(r'.+')),
          Extensions.getExtendedInputFieldAsContainer("Password", RegExp(r'.+')),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        Navigator.pushNamed(context, '/profile');
                      });
                    }
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
      ),
    );
  }
}
