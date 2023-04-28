// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print, await_only_futures

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:http/http.dart' as http;

const apiKey = "89a2173d9e7a8557d64eab9d8889aaea";

class MyCitiesWeatherModel {
  double lat, lon;
  String name;
  String time = "Loading...'";
  String temperature = "Loading...";
  String weatherCondition = "Loading...";

  MyCitiesWeatherModel(String city) {
    name = city;
  }

  Future<void> getWeatherData() async {
    String url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$name&limit=1&appid=$apiKey';
    final response1 = await http.get(Uri.parse(url));

    if (response1.statusCode == 200) {
      final jsonResponse = json.decode(response1.body);
      lat = jsonResponse[0]['lat'];
      lon = jsonResponse[0]['lon'];

      String url =
          'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
      final response2 = await http.get(Uri.parse(url));

      if (response2.statusCode == 200) {
        final weatherData = json.decode(response2.body);

        int temp = (weatherData['current']['temp'] - 273.15).round();
        temperature = "$temp°C";
        weatherCondition = weatherData['current']['weather'][0]['main'];

        await tz.initializeTimeZones();
        var timezone = tz.getLocation(weatherData['timezone']);
        var now = tz.TZDateTime.now(timezone);
        String formattedTime = DateFormat('HH:mm').format(now);
        time = formattedTime;

      } else {
        print("Response Failure: Can't fetch weather data");
      }
    } else {
      print("Response Failure: Can't fetch lat and lon");
    }
  }
}
