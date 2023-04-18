// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class HourlyForecasts extends StatelessWidget {
  const HourlyForecasts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            7,
            (index) => Container(
              margin: const EdgeInsets.all(6),
              width: 120,
              height: 145,
              decoration: BoxDecoration(
                color: myConstants.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 15)),
                Text(
                  "10am",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RussoOne',
                    color: myConstants.titleColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 70,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/thunderstorm.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "18°C",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RussoOne',
                    color: myConstants.titleColor,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
