import 'package:flutter/material.dart';

import '../../../models/constants.dart';
import '../../models/weather_model.dart';

import './widgets/current_weather_state.dart';
import './widgets/hourly_forecast.dart';
import './widgets/weekly_forecasts.dart';

class DetailedWeather extends StatelessWidget {
  final WeatherModel weatherData;
  const DetailedWeather(this.weatherData, {Key key}) : super(key: key);

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
          weatherData.name,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'RussoOne',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              CurrentWeatherState(weatherData.temperature, weatherData.weatherCondition, weatherData.currentWeatherIconId),
              HourlyForecasts(weatherData.hourly),
              WeeklyForecast(weatherData.daily),
            ],
          ),
        ),
      ),
    );
  }
}
