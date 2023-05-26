import 'package:flutter/material.dart';
import '/FrontEnd/registration.dart';
import '/FrontEnd/login.dart';
import '/Other/extensions.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) =>
          const Scaffold(backgroundColor: Extensions.colorDark, body: Login()),
      '/registration': (BuildContext context) => const Scaffold(
          backgroundColor: Extensions.colorDark,
          body: Registration()),
    },
  ));
}
