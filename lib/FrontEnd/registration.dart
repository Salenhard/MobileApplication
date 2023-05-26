import 'package:flutter/material.dart';
import '../Other/extensions.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<StatefulWidget> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";
  String password2 = "";
  int age = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(height: 10.0),
          TextFormField(
            autofillHints: Characters("Input Email here..."),
            validator: (value) {
              if (value!.isEmpty) {
                return "Input Email";
              }
              if (!Extensions.validation(
                  value, RegExp(r'(.+)+(@)+(.{1})+(\.)+.+'))) {
                return "Invalid inputFieldText value";
              } else {
                mail = value;
              }

              return null;
            },
            decoration: Extensions.getTextFormFieldDecoration1("Email"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ),
          TextFormField(
            autofillHints: Characters("Input Password here..."),
            validator: (value) {
              if (value!.isEmpty) {
                return "Input Password";
              }
              if (!Extensions.validation(
                  value,
                  RegExp(
                      r'^(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$'))) {
                return "Invalid inputFieldText value";
              } else {
                password = value;
              }

              return null;
            },
            decoration: Extensions.getTextFormFieldDecoration1("password"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ),
          TextFormField(
            autofillHints: Characters("Input Password here..."),
            validator: (value) {
              if (value!.isEmpty) {
                return "Input Password";
              }
              if (!Extensions.validation(value, RegExp(r'.+'))) {
                return "Invalid inputFieldText value";
              } else {
                password2 = value;
              }

              return null;
            },
            decoration: Extensions.getTextFormFieldDecoration1("password"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ),
          TextFormField(
            autofillHints: Characters("Input Name here..."),
            validator: (value) {
              if (value!.isEmpty) {
                return "Input Name";
              }
              if (!Extensions.validation(value, RegExp(r'^[a-zA-Zа-яА-Я]+$'))) {
                return "Invalid inputFieldText value";
              } else {
                name = value;
              }

              return null;
            },
            decoration: Extensions.getTextFormFieldDecoration1("name"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ),
          TextFormField(
            autofillHints: Characters("Input Age here..."),
            validator: (value) {
              if (value!.isEmpty) {
                return "Input Age";
              }
              if (!Extensions.validation(value, RegExp(r'^\d+$'))) {
                return "Invalid inputFieldText value";
              } else {
                age = int.parse(value);
              }

              return null;
            },
            decoration: Extensions.getTextFormFieldDecoration1("Age"),
            style: const TextStyle(color: Extensions.colorSmooth2),
            textAlignVertical: TextAlignVertical.center,
          ),
          const SizedBox(height: 50.0),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  
                  // Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(color: Colors.white)),
              child: const Text('Регистрация')),
          const SizedBox(height: 50.0),
        ]));
  }
}
