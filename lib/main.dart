import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';
import '/FrontEnd/registration.dart';
import '/FrontEnd/login.dart';
import '/Other/extensions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ClientsDataBase.init();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) =>
          const Scaffold(backgroundColor: Extensions.colorDark, body: Login()),
      '/registration': (BuildContext context) => const Scaffold(
          backgroundColor: Extensions.colorDark, body: Registration()),
    },
  ));
}
