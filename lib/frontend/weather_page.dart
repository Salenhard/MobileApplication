import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Extensions.getAppBarUsual1("Weather."),
      backgroundColor: Extensions.colorDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
