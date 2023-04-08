// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../models/city_weather_model.dart';
import '../../../models/constants.dart';

class UserCitiesList extends StatefulWidget {
  final List<CitiesWeatherModel> myCities;

  const UserCitiesList( this.myCities, {Key key}) : super(key: key);

  @override
  State<UserCitiesList> createState() => _UserCitiesListState();
}

class _UserCitiesListState extends State<UserCitiesList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return SizedBox(
      height: size.height,
      child: ListView.builder(
          itemCount: widget.myCities.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              // TODO: Navigate to another page on tap
              onTap: () {
                print(widget.myCities[index]);
              },
              child: Padding(
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
                          widget.myCities[index].city,
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
              ),
            );
          }),
    );
  }
}
