// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../models/city_weather_model.dart';
import '../../../models/constants.dart';
import '../../detailed_weather/detailed_weather.dart';

class UserCitiesList extends StatefulWidget {
  final List<CitiesWeatherModel> myCities;

  const UserCitiesList(this.myCities, {Key key}) : super(key: key);

  @override
  State<UserCitiesList> createState() => _UserCitiesListState();
}

class _UserCitiesListState extends State<UserCitiesList> {
  
  void _selectedDetailedWeather(BuildContext context, String city) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => DetailedWeather(city)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return SizedBox(
      height: size.height,
      child: ListView.builder(
          itemCount: widget.myCities.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: () => _selectedDetailedWeather(context, widget.myCities[index].city),
              splashColor: myConstants.primaryColor,
              borderRadius: BorderRadius.circular(15),
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
