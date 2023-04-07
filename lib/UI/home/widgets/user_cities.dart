// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class CitiesWeather extends StatefulWidget {
  final List<String> myCities;

  const CitiesWeather({
    Key key,
    @required this.myCities,
  }) : super(key: key);

  @override
  State<CitiesWeather> createState() => _CitiesWeatherState();
}

class _CitiesWeatherState extends State<CitiesWeather> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    final myLocation = Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
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
      ),
    );

    return Container(
      height: size.height,
      child: ListView.builder(
          itemCount: widget.myCities.length,
          itemBuilder: (_, index) {
            return widget.myCities[index] == "MyLocation"
                ? myLocation
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
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
                              widget.myCities[index],
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
                    ),
                  );
          }),
    );
  }
}
