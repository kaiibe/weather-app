import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/constants.dart';

class WeeklyForecast extends StatelessWidget {
  final List<List<String>> daily;
  const WeeklyForecast(this.daily, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return SizedBox(
      width: size.width,
      height: 400,
      child: Column(
        children: daily.map((daily) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  daily[0],
                  style: TextStyle(
                    fontFamily: 'RussoOne',
                    fontSize: 20,
                    color: myConstants.titleColor,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${daily[1]}.png"),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
