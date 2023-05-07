import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class HourlyForecasts extends StatelessWidget {
  final List<List<String>> hourly;
  final bool isCelsius;
  const HourlyForecasts(this.hourly, this.isCelsius, {Key key}) : super(key: key);

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
                color: myConstants.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                Text(
                  hourly[index][0],
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RussoOne',
                    color: myConstants.titleColor,
                  ),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isCelsius ? hourly[index][2] : hourly[index][3],
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
