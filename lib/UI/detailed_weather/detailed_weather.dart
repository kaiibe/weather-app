// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import './widgets/forcast.dart';
import '../../../models/constants.dart';
import '../../models/city_weather_model.dart';

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
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: 200,
              //color: Colors.white,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Text(
                      "18°C",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'RussoOne',
                        color: myConstants.titleColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 20,
                    child: Text(
                      "Thunderstorm",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'RussoOne',
                        color: myConstants.titleColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 270,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/thunderstorm.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Forecasts(),
          ],
        ),
      ),
    );
  }
}
