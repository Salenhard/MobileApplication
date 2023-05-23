import 'package:flutter/material.dart';
class Reistration extends StatefulWidget {
  const Reistration({super.key});

  @override
  State<StatefulWidget> createState() => RegistrationState();
}
class RegistrationState extends State<Reistration> {
  final _formKey = GlobalKey<FormState>();
  String mail = "";
  String password = "";
  String password2 = "";
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
                if (mail != "" && password != "" && password2 != "" && password == password2) {
                  //register new user in app
                }
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