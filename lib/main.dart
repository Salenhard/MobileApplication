import 'package:flutter/material.dart';
import '/FrontEnd/registration.dart';
import '/FrontEnd/weather.dart';
import '/FrontEnd/login.dart';
import '/Other/extensions.dart';
import '/FrontEnd/profile.dart';
import '/FrontEnd/data_from_iot.dart';
import '/FrontEnd/calculator.dart';

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
          appBar: AppBar(title: const Text('Профиль')), body: const Profile()),
      '/weather': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Погода')), body: const Weather()),
      '/calculator': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Калькулятор')),
          body: const Calculator()),
      '/data_from_iot': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Данные с IOT')),
          body: const DataFromIOT()),
    },
  ));
}
