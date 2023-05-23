import 'package:flutter/material.dart';
import 'package:untitled4/registration.dart';
import 'weather.dart';
import 'login.dart';
import 'extensions.dart';
import 'profile.dart';
import 'data_from_iot.dart';
import 'calculator.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          body: const Login()),
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
