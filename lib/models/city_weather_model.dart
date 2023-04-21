// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_print

const apiKey = "1753363c1503391bf24468975ae119ef";

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
