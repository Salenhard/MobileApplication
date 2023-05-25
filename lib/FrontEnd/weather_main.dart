import 'package:flutter/material.dart';
import '../BackEnd/Weather/weather.dart';
import 'application.dart';
import 'weather.dart';

class MainScreenWrapper extends StatelessWidget {
  final Weather weather;

  const MainScreenWrapper({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Menu(),
      Text(
        weather.cityName,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Text(
          '${weather.description}'),
      const Spacer(),
      WeatherCard(
        title: "Now",
        temperature: weather.temperature,
        iconCode: weather.iconCode,
        temperatureFontSize: 64,
        iconScale: 1,
      ),
    ]);
  }
}