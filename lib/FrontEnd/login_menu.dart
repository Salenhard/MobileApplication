import 'package:flutter/material.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';
import 'package:untitled4/FrontEnd/main_menu.dart';
import 'package:untitled4/FrontEnd/registration.dart';
import '/Other/extensions.dart';

class LoginMenu extends StatelessWidget {
  const LoginMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Scaffold(
            backgroundColor: Extensions.colorDark, body: Login()),
        '/registration': (BuildContext context) => const Scaffold(
            backgroundColor: Extensions.colorDark, body: Registration()),
      },
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final _mailTEC = TextEditingController();
  final _passwordTEC = TextEditingController();

  var _isSomeFieldIsEmpty = false;
  var _isInputsIsWrong = false;

  static int id = 0;

  LoginState();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
      child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
        // Title

        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            // color: Colors.amber,
            child: const Text("Hello there.",
                style: Extensions.textStyleMainField1, textScaleFactor: 5),
          ),
        ),

        // Inputs

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              child: TextField(
                controller: _mailTEC,
                style: const TextStyle(color: Extensions.colorSmooth2),
                textAlignVertical: TextAlignVertical.center,
                decoration: Extensions.getTextFormFieldDecoration1("email"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              child: TextField(
                controller: _passwordTEC,
                autocorrect: false,
                obscureText: true,
                style: const TextStyle(color: Extensions.colorSmooth2),
                textAlignVertical: TextAlignVertical.center,
                decoration: Extensions.getTextFormFieldDecoration1("password"),
              ),
            )
          ],
        ),

        // Warnings

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              child: Visibility(
                visible: _isSomeFieldIsEmpty,
                child: const Text(
                  "Input email and password",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Visibility(
                visible: _isInputsIsWrong,
                child: const Text(
                  "Wrong email and\\or password",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),

        // Buttons

        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    onPressed: () async {
                      var mail = _mailTEC.text.replaceAll(r' ', '');
                      var password = _passwordTEC.text.replaceAll(r' ', '');

                      if (mail.isEmpty || password.isEmpty) {
                        setState(() {
                          _isSomeFieldIsEmpty = true;
                        });
                        return;
                      }
                      setState(() {
                        _isSomeFieldIsEmpty = false;
                      });

                      try {
                        if (!(await ClientsDataBase.isThereClientByLoginInfo(
                            mail, password))) {
                          setState(() {
                            _isInputsIsWrong = true;
                          });
                          return;
                        } else {
                          runApp(const MainMenu());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            Extensions.getSnackBar(
                                "Something was wrong with data base\nError: $e"));
                      }

                      setState(() {
                        _isInputsIsWrong = false;
                      });
                    },
                    style: Extensions.buttonElevatedStyleUsual1,
                    child: const Text('Log In',
                        style: Extensions.textStyleUsual1)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: Extensions.buttonElevatedStyleUsual2,
                    child: const Text('Sign Up',
                        style: Extensions.textStyleUsual1)),
              )
            ],
          ),
        ),
      ]),
    ));
  }
}
