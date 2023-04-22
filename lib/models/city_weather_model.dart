// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = "1753363c1503391bf24468975ae119ef";

class CitiesWeatherModel {
  double lat, lon;
  String name;
  String time;
  String temperature;
  String weatherCondition;

  CitiesWeatherModel(double latitude, longitude) {
    lat = latitude;
    lon = longitude;
  }

  Future<void> getWeatherData() async {
    print("$lat $lon");
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=1753363c1503391bf24468975ae119ef';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      int temp = (data['current']['temp'] - 273.15).round();
      temperature = "$temp°C";
      weatherCondition = data['current']['weather'][0]['main'];
    } else {
      print("Response Failure in Model");
    }
  }
}
