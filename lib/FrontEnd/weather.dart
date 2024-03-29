import 'package:flutter/material.dart';
import '/FrontEnd/application.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard({Key? key, required this.title, required this.temperature, required this.iconCode, this.temperatureFontSize = 32, this.iconScale = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        // Добавляем отступы
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Выравниваем по центру
            children: [

              Menu(),
              Text(this.title),
              Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: this.iconScale),
              Text(
                '${this.temperature}°',
                style: TextStyle(fontSize: this.temperatureFontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}