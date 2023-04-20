// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../controllers/global_controller.dart';
class CitiesWeatherModel {

  String id;
  String name;
  String time;
  int temperature;
  String weatherState;

  CitiesWeatherModel(String city) {
    this.name = city;
  }
}
