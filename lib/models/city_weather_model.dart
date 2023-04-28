// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = "89a2173d9e7a8557d64eab9d8889aaea";

class CitiesWeatherModel {
  double lat, lon;
  String name = "Loading...";
  String time= "Loading...";
  String temperature= "Loading...";
  String weatherCondition= "Loading...";

  CitiesWeatherModel(double latitude, longitude) {
    lat = latitude;
    lon = longitude;
  }

  Future<void> getWeatherData() async {
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
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
