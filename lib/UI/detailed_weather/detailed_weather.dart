import 'package:flutter/material.dart';

import '/models/constants.dart';
import '../../models/city_weather_model.dart';

class DetailedWeather extends StatelessWidget {
  final String city;
  const DetailedWeather(this.city, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return Scaffold(
      backgroundColor: myConstants.pageColor,
      appBar: AppBar(
        backgroundColor: myConstants.pageColor,
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Text(city),
    );
  }
}
