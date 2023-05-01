import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class CurrentWeatherState extends StatelessWidget {
  final String celsiusTemperature;
  final String fahrenheitTemperature;
  final String weatherCondition;
  final String currentWeatherIconId;
  final bool isCelsius;

  const CurrentWeatherState(this.celsiusTemperature, this.fahrenheitTemperature, this.weatherCondition,
      this.currentWeatherIconId, this.isCelsius,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              isCelsius ? celsiusTemperature : fahrenheitTemperature,
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
              weatherCondition,
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
                  image: AssetImage("assets/images/$currentWeatherIconId.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
