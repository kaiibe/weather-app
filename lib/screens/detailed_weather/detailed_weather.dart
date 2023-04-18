// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../models/constants.dart';
import '../../models/city_weather_model.dart';

import './widgets/current_weather_state.dart';
import './widgets/hourly_forecast.dart';
import './widgets/weekly_forecasts.dart';

class DetailedWeather extends StatelessWidget {
  final CitiesWeatherModel city;
  const DetailedWeather(this.city, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: myConstants.pageColor.withOpacity(1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: myConstants.pageColor,
        title: Text(
          city.city,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'RussoOne',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            children: [
              CurrentWeatherState(),
              HourlyForecasts(),
              WeeklyForecast(),
            ],
          ),
        ),
      ),
    );
  }
}
