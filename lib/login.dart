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
      child: Column(children: [
        Extensions.packageWidgetsAsRow(
            Extensions.buildExtendedInputFieldAsList("Email", RegExp(r'.+'))),
        Extensions.packageWidgetsAsRow(Extensions.buildExtendedInputFieldAsList(
            "Password", RegExp(r'.+'))),
        // const SizedBox(height: 10.0),

        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  Navigator.pushNamed(context, '/profile');
                });
              }
            },
            style: Extensions.buttonStyle1,
            child: const Text('Log In', style: TextStyle(color: Colors.white))),

        // const SizedBox(height: 50.0),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registration');
            },
            style: Extensions.buttonStyle1,
            child: const Text('Registration',
                style: TextStyle(color: Colors.white))),
        // const SizedBox(height: 50.0),
      ]),
    );
  }
}
