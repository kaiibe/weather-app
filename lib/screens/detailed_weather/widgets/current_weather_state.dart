import 'package:flutter/material.dart';


import '../../../models/constants.dart';

class CurrentWeatherState extends StatelessWidget {
  const CurrentWeatherState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;


    return SizedBox(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/thunderstorm.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
