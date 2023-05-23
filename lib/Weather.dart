import 'package:flutter/material.dart';
import 'application.dart';

class Weather extends StatefulWidget{
  const Weather({super.key});

  @override
  createState() => WeatherState();
}

class WeatherState extends State<Weather>{
  @override
  build(BuildContext context){
    return Column(
      children: [
        Container(
          child: const Menu(),
        )
      ],
    );
  }
}