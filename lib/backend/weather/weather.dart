import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  static const _apiKey = "7cf3fe86c6e54d14a8e234419231106";
  static const _cityName = "Chita";

  static Future<String> weather({required Function(Object) onError}) async {
    String res = "";

    const url =
        "https://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$_cityName&aqi=no";

    try {
      var body = json.decode((await http.get(Uri.parse(url))).body)["current"];

      res = "${body["temp_c"]} °С; ${body["condition"]["text"]}";
    } catch (e) {
      onError(e);
    }

    return res;
  }
}
