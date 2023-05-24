import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/calculator');
      }, style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Калькулятор')),
      const SizedBox(height: 50.0),
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/weather');},
          style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Погода')),
      const SizedBox(height: 50.0),
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/profile');},
          style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Профиль')),
      const SizedBox(height: 50.0),
      ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, '/data_from_iot');},
          style: ElevatedButton.styleFrom( backgroundColor: Colors.blue, textStyle: const TextStyle(color: Colors.white)), child: const Text('Данные с IOT')),
      const SizedBox(height: 50.0),

    ]);

  }
} 