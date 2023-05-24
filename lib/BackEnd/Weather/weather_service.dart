import 'dart:convert';
import 'weather.dart';
import 'package:http/http.dart';

class WeatherService {
  static const String _apiKey = "91320940294e5c61e0741ca35f382be0";

  
  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await post(url as Uri);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}