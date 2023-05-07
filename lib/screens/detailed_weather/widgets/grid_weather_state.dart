import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class GridWeatherState extends StatelessWidget {
  final String feelsLikeCelsius;
  final String feelsLikeFahrenheit;
  final String humidity;
  final String windSpeed;
  final String uvIndex;
  final bool isCelsius;

  const GridWeatherState(this.feelsLikeCelsius, this.feelsLikeFahrenheit,
      this.humidity, this.windSpeed, this.uvIndex, this.isCelsius,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: myConstants.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Feels like",
                      style: TextStyle(
                        color: myConstants.titleColor,
                        fontSize: 18,
                        fontFamily: 'RussoOne',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.device_thermostat,
                      size: 25,
                      color: myConstants.titleColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    isCelsius ? feelsLikeCelsius : feelsLikeFahrenheit,
                    style: TextStyle(
                      color: myConstants.titleColor.withOpacity(1),
                      fontSize: 40,
                      fontFamily: 'RussoOne',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: myConstants.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Humidity",
                      style: TextStyle(
                        color: myConstants.titleColor,
                        fontSize: 18,
                        fontFamily: 'RussoOne',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.bottomRight,
                    child: ImageIcon(
                      const AssetImage('assets/icons/humidity.png'),
                      size: 30,
                      color: myConstants.titleColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    humidity,
                    style: TextStyle(
                      color: myConstants.titleColor.withOpacity(1),
                      fontSize: 40,
                      fontFamily: 'RussoOne',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: myConstants.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Wind Speed",
                      style: TextStyle(
                        color: myConstants.titleColor,
                        fontSize: 18,
                        fontFamily: 'RussoOne',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      CupertinoIcons.wind,
                      size: 25,
                      color: myConstants.titleColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    windSpeed,
                    style: TextStyle(
                      color: myConstants.titleColor.withOpacity(1),
                      fontSize: 40,
                      fontFamily: 'RussoOne',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: myConstants.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "UV Index",
                      style: TextStyle(
                        color: myConstants.titleColor,
                        fontSize: 18,
                        fontFamily: 'RussoOne',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.sunny,
                      size: 25,
                      color: myConstants.titleColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    uvIndex,
                    style: TextStyle(
                      color: myConstants.titleColor.withOpacity(1),
                      fontSize: 40,
                      fontFamily: 'RussoOne',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
