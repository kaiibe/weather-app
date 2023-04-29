import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class HourlyForecasts extends StatelessWidget {
  final List<List<String>> hourly;
  const HourlyForecasts(this.hourly, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            24,
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
                  hourly[index][0],
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
                      image:
                          AssetImage("assets/images/${hourly[index][1]}.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  hourly[index][2],
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
