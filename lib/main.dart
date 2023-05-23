import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Вход')),
            body: const Login()
        )
    )
);