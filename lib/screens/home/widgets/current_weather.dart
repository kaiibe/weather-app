import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../../models/constants.dart';

import '../../../controllers/global_controller.dart';

import '../../detailed_weather/detailed_weather.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  String city = "";

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lot) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lot);

    Placemark place = placemark[0];

    setState(() {
      city = place.locality;
    });
  }

  void _selectedDetailedWeather(BuildContext context, city) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => DetailedWeather(city)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();
    return InkWell(
      onTap: () {
        _selectedDetailedWeather(context, city);
      },
      child: Container(
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
                  city,
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
  }
}
