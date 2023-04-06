// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

import '/models/constants.dart';
import 'widgets/app_bar.dart';
import './widgets/my_location_weather.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();
    final editOptions = ["Edit", "C", "F"];

    return Scaffold(
        backgroundColor: myConstants.pageColor,
        appBar: myAppBar(context),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            MyLocationWeather(),
          ],
        ));
  }
}
