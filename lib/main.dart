import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/database.dart';
import 'package:untitled4/FrontEnd/profile.dart';
import '/FrontEnd/registration.dart';
import '/FrontEnd/login.dart';
import '/Other/extensions.dart';
import '/FrontEnd/data_from_iot.dart';
import '/FrontEnd/calculator.dart';
import 'BackEnd/database/client_model.dart';
import 'FrontEnd/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int id = 0;
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => Scaffold(
            backgroundColor: Extensions.colorDark,
            appBar: AppBar(
              title: const Text("Welcome!",
                  style: TextStyle(color: Extensions.colorBright)),
              backgroundColor: Extensions.colorSmooth1
            ),
            body: FutureBuilder<List<Client>>(
                future: DatabaseHelper.instance.getClients(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Client>> snapshot) {
                  if (snapshot.hasData) {
                    List<Client>? list = snapshot.data;
                    return Login(list!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
      '/registration': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          appBar: AppBar(title: const Text('Registration', style: TextStyle(color: Extensions.colorBright)),
  backgroundColor: Extensions.colorSmooth1),
          body: const Registration()),
      '/profile': (BuildContext context) => Scaffold(
            backgroundColor: Extensions.colorDark,
            appBar: AppBar(title: const Text('Profile', style: TextStyle(color: Extensions.colorBright)),
  backgroundColor: Extensions.colorSmooth1),
            body: FutureBuilder<List<Client>>(
                future: DatabaseHelper.instance.getClients(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Client>> snapshot) {
                  if (snapshot.hasData) {
                    List<Client>? list = snapshot.data;
                    Client client = list![id];
                    return Profile(client);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
      '/weather': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          appBar: AppBar(title: const Text('Weather', style: TextStyle(color: Extensions.colorBright)),
              backgroundColor: Extensions.colorSmooth1),
          body: const WeatherPage()),
      '/calculator': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          appBar: AppBar(title: const Text('Calculator', style: TextStyle(color: Extensions.colorBright)),
              backgroundColor: Extensions.colorSmooth1),
          body: const Calculator()),
      '/data_from_iot': (BuildContext context) => Scaffold(
          backgroundColor: Extensions.colorDark,
          appBar: AppBar(title: const Text('Data from IOT', style: TextStyle(color: Extensions.colorBright)),
              backgroundColor: Extensions.colorSmooth1),
          body: DataFromIOT(
            url: '',
          )),
    },
  ));
}
