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

  final _nameTEC = TextEditingController();
  final _mailTEC = TextEditingController();
  final _passwordOldTEC = TextEditingController();
  final _password1TEC = TextEditingController();
  final _password2TEC = TextEditingController();

  @override
  void initState()
  {
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
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              // Inputs

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Extensions.getFullInputFieldAsColumn(
                      "Name",
                      Extensions.getTextFormFieldValidator(
                          "name", RegExp(r'.+')),
                      _nameTEC),
                  Extensions.getFullInputFieldAsColumn(
                      "Email",
                      Extensions.getTextFormFieldValidator(
                          "email", RegExp(r'(.+)+(@)+(.{1})+(\.)+.+')),
                      _mailTEC),
                  Extensions.getFullInputFieldAsColumn(
                      "Password",
                      Extensions.getTextFormFieldValidator(
                          "password",
                          RegExp(
                              r'^(?=.*[^ ])(?=.*?[A-ZА-Я])(?=.*?[a-zа-я])(?=.*?[0-9]).{8,}$')),
                      _password1TEC,
                      isPassword: true),
                  Extensions.getFullInputFieldAsColumn("Repeat password",
                      (value) {
                    if (value!.isEmpty) {
                      return "Repeat password";
                    }

                    if (value != _password1TEC.text) {
                      return "Password does not match";
                    }

                    return null;
                  }, _password2TEC, isPassword: true),
                ],
              ),

              // Button

              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var mail = _mailTEC.text.replaceAll(r' ', '');
                        var password = _password1TEC.text.replaceAll(r' ', '');

                        try {
                          if (await ClientsDataBase.isThereClientByMail(mail)) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                Extensions.getSnackBar(
                                    "This email is already taken. Please enter a different email"));
                            return;
                          }

                          await ClientsDataBase.insert(Client(
                              name: _nameTEC.text,
                              mail: mail,
                              password: password));

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              Extensions.getSnackBar(
                                  "Registration successful, login to continue"));

                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              Extensions.getSnackBar(
                                  "Something was wrong with data base\nError: $e"));
                        }
                      }
                    },
                    style: Extensions.buttonElevatedStyleUsual1,
                    child: const Text('Sign Up',
                        style: Extensions.textStyleUsual1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
