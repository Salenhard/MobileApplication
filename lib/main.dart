import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled4/BackEnd/database/database.dart';
import '/FrontEnd/registration.dart';
import '/FrontEnd/login.dart';
import '/Other/extensions.dart';
import '/FrontEnd/profile.dart';
import '/FrontEnd/data_from_iot.dart';
import '/FrontEnd/calculator.dart';
import 'FrontEnd/weather_page.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const Scaffold(
          backgroundColor: Extensions.colorDark,
          body: Login()),
      '/registration': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Регистрация')),
          body: const Registration()),
      '/profile': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Профиль')),
          body: const Profile()),
      '/weather': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Погода')),
          body: const MyHomePage()),
      '/calculator': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Калькулятор')),
          body: const Calculator()),
      '/data_from_iot': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Данные с IOT')),
          body: const DataFromIOT()),
    },
  ));
}
