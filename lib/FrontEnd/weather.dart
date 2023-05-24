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
    return const Column(
      children: [
        Menu(),
      ],
    );
  }
}