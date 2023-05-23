import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}
class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey, child: Column(
        children: [
          Row(children: <Widget>[
            Container(padding:const EdgeInsets.all(10.0),child: const Text('Mail:')),
            Expanded(child: Container(padding:const EdgeInsets.all(10.0),child:
            TextFormField(validator: (value){
              if (value!.isEmpty) return 'Введите почту!';

              try {
                mail = value;
              } catch(e) {
                mail = "";
                return e.toString();
              }
            }, initialValue: "")
            )),
          ]
          ),

          const SizedBox(height: 10.0),

          Row(children: <Widget>[
            Container(padding:const EdgeInsets.all(10.0),child: const Text('Пароль:')),
            Expanded(child: Container(padding:const EdgeInsets.all(10.0),child:
            TextFormField(validator: (value){
              if (value!.isEmpty) return 'Введите пароль!';

              try {
                password = value;
              } catch(e) {
                password = "";
                return e.toString();
              }
            }, initialValue: "")
            )),
          ]
          ),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()) {
              setState(() {
                if (mail != "" && password != "");
              });
            }
          }, style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Вход')),

          const SizedBox(height: 50.0),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()) {
              setState(() {
              });
            }
          }, style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Регистрация')),

          const SizedBox(height: 50.0),

        ]
    ));
  }
}


