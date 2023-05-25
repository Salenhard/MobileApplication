import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/database.dart';
import '../BackEnd/database/client_model.dart';
import '/Other/extensions.dart';

class Login extends StatefulWidget {
  final List<Client> list;
  const Login(this.list, {super.key});

  @override
  State<StatefulWidget> createState() => LoginState(list);
}

class LoginState extends State<Login> {
  final List<Client> list;
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";

  LoginState(this.list);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(30.0),
              child: const Text("Log In",
                  style: TextStyle(
                      color: Extensions.colorBright,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 3.0)),

          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth()
            },
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Expanded(child: Container(color: Colors.amber, child: const Text("TEST"))),
                ],
              )
            ],
          ),

          // Extensions.getExtendedInputFieldAsContainer("Email", RegExp(r'.+')),
          // Extensions.getExtendedInputFieldAsContainer("Password", RegExp(r'.+')),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        for(int i = 0; i < list.length; i++)
                          {
                            if(mail == list[i].mail) {
                              if (password == list[i].password) {
                                Navigator.pushNamed(context, '/profile');
                              }

                              else{
                                // wrong password
                              }
                            }
                            else {
                              // wrong mail
                            }
                          }

                      });
                    }
                  },
                  style: Extensions.buttonStyleUsual1,
                  child: const Text('Log In',
                      style: TextStyle(color: Extensions.colorBright))),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  style: Extensions.buttonStyleUsual1,
                  child: const Text('Registration',
                      style: TextStyle(color: Extensions.colorBright)))
            ]),
          )
        ],
      ),
    );
  }
}
