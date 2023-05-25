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
import 'BackEnd/database/client_model.dart';
import 'FrontEnd/weather_page.dart';
void main() async {

  SqliteService service = SqliteService();
  service.createItem(Client(name: "name", mail: "mail", password: "password", age: 20));
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          appBar: AppBar(title: const Text("Добро пожаловать!")),
          body: FutureBuilder<List<Client>>(
              future: service.getItems(),
              builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
                if (snapshot.hasData) {
                  List<Client>? list = snapshot.data;
                  return Login(list!);
                  }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
          ),
      ),
      '/registration': (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Регистрация')),
          body: const Registration()),
      // '/profile': (BuildContext context) => Scaffold(
      //     appBar: AppBar(title: const Text('Профиль')),
      //     body: Profile(client)),
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
