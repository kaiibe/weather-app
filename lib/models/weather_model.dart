// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:http/http.dart' as http;

import 'constants.dart';

String apiKey = Constants().apiKey;

class WeatherModel {
  double lat, lon;
  String name = "-/-";
  String time = "-/-";
  String celsiusTemperature = "-/-";
  String fahrenheitTemperature = "-/-";
  String weatherCondition = "-/-";
  String currentWeatherIconId = "";
  List<List<String>> hourly = [];
  List<List<String>> daily = [];
  bool gotResponse = false;

  WeatherModel({String city}) {
    name = city;
  }

  Future<void> getWeatherData() async {
    String coordsURL =
        'https://api.openweathermap.org/geo/1.0/direct?q=$name&limit=1&appid=$apiKey';
    final coordsResponse = await http.get(Uri.parse(coordsURL));

    if (coordsResponse.statusCode == 200) {
      final coordsJsonResponse = json.decode(coordsResponse.body);
      lat = coordsJsonResponse[0]['lat'];
      lon = coordsJsonResponse[0]['lon'];
    } else {
      print(
          "Response Failure: Can't fetch lat and lon in my city weather model $name");
    }

    String weatherURL =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
    final weatherResponse = await http.get(Uri.parse(weatherURL));

    if (weatherResponse.statusCode == 200) {
      final weatherData = json.decode(weatherResponse.body);

      setTemperature(weatherData);
      setWeatherCondition(weatherData);
      setTime(weatherData);
      setWeatherIconId(weatherData);
      setHourlyForecast(weatherData);
      setDailyForecast(weatherData);

      gotResponse = true;
    } else {
      print("Response Failure: Can't fetch weather data");
    }
  }

  void setTemperature(weatherData) {
    int celsiusTemp = (weatherData['current']['temp'] - 273.15).round();
    int fahrenheitTemp = (celsiusTemp * 9 / 5 + 32).round();

    celsiusTemperature = "$celsiusTemp°C";
    fahrenheitTemperature = "$fahrenheitTemp°F";
  }

  void setWeatherCondition(weatherData) {
    weatherCondition = weatherData['current']['weather'][0]['description'];
  }

  void setTime(weatherData) {
    tz.initializeTimeZones();
    var timezone = tz.getLocation(weatherData['timezone']);
    var now = tz.TZDateTime.now(timezone);
    String formattedTime = DateFormat('HH:mm').format(now);
    time = formattedTime;
  }

  void setWeatherIconId(weatherData) {
    currentWeatherIconId = weatherData['current']['weather'][0]['icon'];
  }

  void setHourlyForecast(weatherData) {
    List<String> cnt = [];
    for (int i = 0; i < 24; i++) {
      cnt = [];

      final timestamp = weatherData['hourly'][i]['dt'];
      final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      final formattedTime = DateFormat('h a').format(time);
      cnt.add(formattedTime);

      cnt.add(weatherData['hourly'][i]['weather'][0]['icon']);

      int celsiusTemp = (weatherData['hourly'][i]['temp'] - 273.15).round();
      int fahrenheitTemp = (celsiusTemp * 9 / 5 + 32).round();

      cnt.add("$celsiusTemp°C");
      cnt.add("$fahrenheitTemp°f");

      hourly.add(cnt);
    }
  }

  void setDailyForecast(weatherData) {
    List<String> cnt = [];
    for (int i = 0; i < 7; i++) {
      cnt = [];
      int timestamp = weatherData['daily'][i]['dt'];
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      String weekday = DateFormat('EEEE').format(dateTime);
      cnt.add(weekday);
      cnt.add(weatherData['daily'][i]['weather'][0]['icon']);
      daily.add(cnt);
    }
  }
}
