import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../../models/constants.dart';
import '../../../models/weather_model.dart';

import '../../../server/geolocator.dart';

import '../../detailed_weather/detailed_weather.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  String city = "";
  double lat, lon;

  String temperature = "Loading...";
  String weatherCondition = "Loading...";

  final GeolocatorController geolocator =
      Get.put(GeolocatorController(), permanent: true);

  void pushDetailedWeather(BuildContext context, WeatherModel data) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => DetailedWeather(data)),
      ),
    );
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality;
    });
  }

  @override
  void initState() {
    lat = geolocator.getLatitude().value;
    lon = geolocator.getLongitude().value;
    getAddress(lat, lon);

    super.initState();
  }

  Future<WeatherModel> getWeatherData(double lat, double lon, String city) async {
    final data = WeatherModel(latitude: lat, longitude: lat, city: city);
    await data.getWeatherData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return FutureBuilder<WeatherModel>(
      future: getWeatherData(lat, lon, city),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return InkWell(
            onTap: () {
              pushDetailedWeather(context, data);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: size.width,
                height: 110,
                decoration: BoxDecoration(
                  color: myConstants.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Text(
                        "My Location",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'RussoOne',
                            color: myConstants.titleColor),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 15,
                      child: Text(
                        data.name,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'RussoOne',
                            color: myConstants.titleColor),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.temperature,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'RussoOne',
                                color: myConstants.titleColor),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.weatherCondition,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'RussoOne',
                                color: myConstants.titleColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text("Error loading weather data.");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

// sd