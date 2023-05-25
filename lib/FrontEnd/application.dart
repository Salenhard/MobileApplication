import 'package:flutter/material.dart';

import '../Other/extensions.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/calculator');
          },
          style: Extensions.buttonStyleUsual1,
          child: const Text('Calculator',
              style: TextStyle(color: Extensions.colorBright))),
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/weather');
          },
          style: Extensions.buttonStyleUsual1,
          child: const Text('Weather',
              style: TextStyle(color: Extensions.colorBright))),
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          style: Extensions.buttonStyleUsual1,
          child: const Text('Profile',
              style: TextStyle(color: Extensions.colorBright))),
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/data_from_iot');
          },
          style: Extensions.buttonStyleUsual1,
          child: const Text('Data IOT',
              style: TextStyle(color: Extensions.colorBright))),
    ]);
  }
}
