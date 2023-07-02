import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/home/home.dart';

import '../../../models/constants.dart';

class DailyForecast extends StatelessWidget {
  final List<List<String>> daily;
  const DailyForecast(this.daily, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return Container(
      width: size.width,
      height: 520,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: myConstants.primaryColor.withOpacity(0.2),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Icon(
                      CupertinoIcons.calendar,
                      color: myConstants.titleColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      "7-days forecast",
                      style: TextStyle(
                          color: myConstants.titleColor,
                          fontFamily: 'RussoOne',
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
              Container(
                height: 0.2,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[300],
              ),
            ],
          ),
          Column(
            children: daily.map((daily) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Text(
                            daily[0],
                            style: TextStyle(
                              fontFamily: 'RussoOne',
                              fontSize: 20,
                              color: myConstants.titleColor.withOpacity(1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: isCelsius
                              ? RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color:
                                          myConstants.titleColor.withOpacity(1),
                                      fontFamily: 'RussoOne',
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(text: '${daily[1]}/'),
                                      TextSpan(
                                        text: daily[2],
                                        style: TextStyle(
                                            color: myConstants.titleColor),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: myConstants.titleColor
                                          .withOpacity(0.8),
                                      fontFamily: 'RussoOne',
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(text: '${daily[3]}/'),
                                      TextSpan(
                                        text: daily[4],
                                        style: TextStyle(
                                            color: myConstants.titleColor),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Container(
                          width: 70,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/${daily[5]}.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.2,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.grey[300],
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
