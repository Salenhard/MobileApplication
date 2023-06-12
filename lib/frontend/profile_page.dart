import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';
import 'package:untitled4/BackEnd/database/client_model.dart';
import 'package:untitled4/BackEnd/database/data_base.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  var _isNewPasswordInput = false;
  var _isValidPassword = true;

  final _nameTEC = TextEditingController();
  final _mailTEC = TextEditingController();
  final _passwordOldTEC = TextEditingController();
  final _password1TEC = TextEditingController();
  final _password2TEC = TextEditingController();

  bool get _isOldPasswordValid =>
      _passwordOldTEC.text == ClientsDataBase.user!.password;

  Widget get _passwordChanging {
    if (_isNewPasswordInput) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Extensions.getFullInputFieldAsColumn(
              "New password",
              Extensions.getTextFormFieldValidator(
                  "password", Extensions.passwordRegExp),
              _password1TEC,
              isPassword: true),
          Extensions.getFullInputFieldAsColumn("Repeat password", (value) {
            if (value!.isEmpty) {
              return "Repeat password";
            }

            if (value != _password1TEC.text) {
              return "Password does not match";
            }

            return null;
          }, _password2TEC, isPassword: true),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Extensions.getFullInputFieldAsColumn(
              "Current password", (p0) => null, _passwordOldTEC,
              isPassword: true,
              hintText: "To change your password, first enter your current",
              hintTextStyle: Extensions.textStyleHintUsual1),
          Visibility(
              visible: !_isValidPassword,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Wrong password",
                  style: TextStyle(color: Colors.red),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              if (_isOldPasswordValid) {
                setState(() {
                  _passwordOldTEC.text =
                      _password1TEC.text = _password2TEC.text = "";
                  _isNewPasswordInput = _isValidPassword = true;
                });
              } else {
                setState(() {
                  _isNewPasswordInput = _isValidPassword = false;
                });
              }
            },
            style: Extensions.buttonElevatedStyleUsual2,
            child: const Text(
              "Change password",
              style: Extensions.textStyleMainField1,
            ),
          ),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameTEC.text = ClientsDataBase.user!.name;
    _mailTEC.text = ClientsDataBase.user!.mail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Extensions.colorDark,
      appBar: Extensions.getAppBarUsual1("Weather."),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Column(
            children: [
              // Inputs

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Extensions.getFullInputFieldAsColumn(
                      "Name",
                      Extensions.getTextFormFieldValidator(
                          "name", Extensions.emptyRegExp),
                      _nameTEC),
                  Extensions.getFullInputFieldAsColumn(
                      "Email",
                      Extensions.getTextFormFieldValidator(
                          "email", Extensions.mailRegExp),
                      _mailTEC),
                  _passwordChanging,
                ],
              ),

              // Button

              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var mail = _mailTEC.text.replaceAll(r' ', '');
                        var password = _isNewPasswordInput
                            ? _password1TEC.text.replaceAll(r' ', '')
                            : ClientsDataBase.user!.password;
                        try {
                          if (mail != ClientsDataBase.user!.mail &&
                              await ClientsDataBase.isThereClientByMail(mail)) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                Extensions.getSnackBar(
                                    "This email is already taken. Please enter a different email"));
                            return;
                          }

                          await ClientsDataBase.updateCliend(Client(
                              name: _nameTEC.text,
                              mail: mail,
                              password: password));

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              Extensions.getSnackBar("Profile updated"));

                          if (_isNewPasswordInput) {
                            setState(() {
                              _isNewPasswordInput = false;
                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              Extensions.getSnackBar(
                                  "Something was wrong with data base\nError: $e"));
                        }
                      }
                    },
                    style: Extensions.buttonElevatedStyleUsual1,
                    child: const Text('Update',
                        style: Extensions.textStyleUsual1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
