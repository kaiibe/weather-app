// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:http/http.dart' as http;

// 1753363c1503391bf24468975ae119ef
// 89a2173d9e7a8557d64eab9d8889aaea
const apiKey = "1753363c1503391bf24468975ae119ef";

class WeatherModel {
  double lat, lon;
  String name = "Loading...";
  String time = "Loading...";
  String celsiusTemperature = "Loading...";
  String fahrenheitTemperature = "Loading...";
  String weatherCondition = "Loading...";
  String currentWeatherIconId;
  List<List<String>> hourly = [];
  List<List<String>> daily = [];

  WeatherModel({String city, double latitude, double longitude}) {
    name = city;
    lat = latitude;
    lon = longitude;
  }

  Future<void> getWeatherData() async {
    if (lat == null && lon == null) {
      String coordsURL =
          'https://api.openweathermap.org/geo/1.0/direct?q=$name&limit=1&appid=$apiKey';
      final coordsResponse = await http.get(Uri.parse(coordsURL));

      if (coordsResponse.statusCode == 200) {
        final coordsJsonResponse = json.decode(coordsResponse.body);
        lat = coordsJsonResponse[0]['lat'];
        lon = coordsJsonResponse[0]['lon'];
      } else {
        print(
            "Response Failure: Can't fetch lat and lon in my city weather model");
      }
    }

    String weatherURL =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
    final weatherResponse = await http.get(Uri.parse(weatherURL));

    if (weatherResponse.statusCode == 200) {
      final weatherData = json.decode(weatherResponse.body);

      setTemperature(weatherData['current']['temp']);
      weatherCondition =
          getWeatherCondition(weatherData['current']['weather'][0]['main']);

      tz.initializeTimeZones();
      var timezone = tz.getLocation(weatherData['timezone']);
      var now = tz.TZDateTime.now(timezone);
      String formattedTime = DateFormat('HH:mm').format(now);
      time = formattedTime;

      currentWeatherIconId = weatherData['current']['weather'][0]['icon'];

      List<String> cnt = [];
      for (int i = 0; i < 24; i++) {
        cnt = [];

        final timestamp = weatherData['hourly'][i]['dt'];
        final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
        final formattedTime = DateFormat('h a').format(time);
        cnt.add(formattedTime);

        cnt.add(weatherData['hourly'][i]['weather'][0]['icon']);

        final temp = (weatherData['hourly'][i]['temp'] - 273.15).round();
        cnt.add("$temp°C");

        hourly.add(cnt);
      }

      for (int i = 0; i < 7; i++) {
        cnt = [];
        int timestamp = weatherData['daily'][i]['dt'];

        DateTime dateTime =
            DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
        String weekday = DateFormat('EEEE').format(dateTime);

        cnt.add(weekday);
        cnt.add(weatherData['daily'][i]['weather'][0]['icon']);

        daily.add(cnt);
      }
    } else {
      print("Response Failure: Can't fetch weather data");
    }
  }

  void setTemperature(temperature) {
    int celsiusTemp = (temperature - 273.15).round();
    int fahrenheitTemp = (celsiusTemp * 9 / 5 + 32).round();

    celsiusTemperature = "$celsiusTemp°C";
    fahrenheitTemperature = "$fahrenheitTemp°F";
  }

  String getWeatherCondition(condition) {
    return condition;
  }
}
