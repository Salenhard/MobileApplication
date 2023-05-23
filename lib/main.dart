import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:untitled4/registration.dart';
import 'Weather.dart';
import 'login.dart';
import 'profile.dart';
import 'data_from_iot.dart';
import 'calcuator.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

void main(){runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
          '/':(BuildContext context) => Scaffold(
              appBar: AppBar(title: const Text('Вход')),
              body: const Login()
          ),
          '/registration':(BuildContext context) => Scaffold(
              appBar: AppBar(title: const Text('Регистрация')),
              body: const Registration()
          ),
        '/profile':(BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Профиль')),
            body: const Profile()
        ),
        '/weather':(BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Погода')),
            body: Weather()
        ),
        '/calculator':(BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Калькулятор')),
            body: const Calculator()
        ),
        '/data_from_iot':(BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Данные с IOT')),
            body: DataFromIOT()
        ),

        },
     ));
    }