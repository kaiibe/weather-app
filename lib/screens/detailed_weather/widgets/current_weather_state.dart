import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class CurrentWeatherState extends StatelessWidget {
  final String celsiusTemperature;
  final String fahrenheitTemperature;
  final String weatherCondition;
  final String currentWeatherIconId;
  final bool isCelsius;

  const CurrentWeatherState(this.celsiusTemperature, this.fahrenheitTemperature,
      this.weatherCondition, this.currentWeatherIconId, this.isCelsius,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isCelsius ? celsiusTemperature : fahrenheitTemperature,
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'RussoOne',
                    color: myConstants.titleColor.withOpacity(1),
                  ),
                ),
                Text(
                  weatherCondition,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RussoOne',
                    color: myConstants.titleColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$currentWeatherIconId.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
