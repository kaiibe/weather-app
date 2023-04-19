// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print

import 'package:geolocator/geolocator.dart';

void getMyLocation() async {
  Position myLocation = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

  print(myLocation);
}

class CitiesWeatherModel {
  String id;
  String name;
  String time;
  int temperature;
  String weatherState;

  CitiesWeatherModel(String city) {
    if (city == "My Location") {
      this.name = "My Location";
      getMyLocation();
    } else {
      this.name = city;
    }
  }
}
