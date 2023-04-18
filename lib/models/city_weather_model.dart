// ignore_for_file: prefer_initializing_formals

import 'package:intl/intl.dart';

class CitiesWeatherModel {
  String id;
  String city;
  int temperature;
  String weatherState;
  DateTime now;
  String dateTime;

  CitiesWeatherModel(String city) {
    this.city = city;
    now = DateTime.now();
    dateTime = DateFormat('EEE, d MMMM').format(now);
  }
}
