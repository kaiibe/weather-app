// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/constants.dart';
import '../../../models/city_weather_model.dart';

import '../../../server/geolocator.dart';

import '../../detailed_weather/detailed_weather.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather();

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  String city = "";
  double lat, lon;

  CitiesWeatherModel myLocationWeatherData;
  String temperature = "Loading...";
  String weatherCondition = "Loading...";

  final GeolocatorController geolocator =
      Get.put(GeolocatorController(), permanent: true);

  void pushDetailedWeather(BuildContext context, city) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => DetailedWeather(city)),
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

  void getWeatherData() async {
    myLocationWeatherData = CitiesWeatherModel(lat, lon);
    await myLocationWeatherData.getWeatherData();

    setState(() {
      temperature = myLocationWeatherData.temperature;
      weatherCondition = myLocationWeatherData.weatherCondition;
      print(weatherCondition);
    });
  }

  @override
  void initState() {
    lat = geolocator.getLatitude().value;
    lon = geolocator.getLongitude().value;
    getAddress(lat, lon);
    //getWeatherData();

    getWeatherData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return InkWell(
      onTap: () {
        pushDetailedWeather(context, city);
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
                  city,
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
                      temperature,
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
                      weatherCondition,
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
  }
}

// sd