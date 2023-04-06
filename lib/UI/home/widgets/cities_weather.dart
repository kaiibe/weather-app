import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class CitiesWeather extends StatelessWidget {
  const CitiesWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();
    return Container(
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
              "Potsdam",
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
                  "18C",
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
                  "Partly Cloudy",
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
    );
  }
}