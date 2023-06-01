import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';
import '../BackEnd/database/client_model.dart';
import '../Other/extensions.dart';

class MainMenu extends StatelessWidget {
  final Client user;

  const MainMenu({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => Scaffold(
              backgroundColor: Extensions.colorDark,
              body: MainForm(user: user)),
        });
  }
}

class MainForm extends StatelessWidget {
  final Client user;

  const MainForm({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text("Hi, ${user.name}.",
                style: Extensions.textStyleMainField1, textScaleFactor: 2),
          ),
        ],
      ),
    ));
  }
}
