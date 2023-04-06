// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

import '/models/constants.dart';
import './widgets/my_location_weather.dart';
import './widgets/cities_weather.dart';

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
    final myCities = ["Berlin", "Dushanbe"];

    final appBar = AppBar(
      backgroundColor: myConstants.pageColor,
      elevation: 0.0,
      centerTitle: false,
      titleSpacing: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Weather",
              style: TextStyle(
                fontFamily: 'RussoOne',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(
          onSelected: (selectedValue) {
            if (selectedValue == "Add") {
              myCities.add("Berlin");
            }
          },
          icon: Icon(Icons.menu),
          itemBuilder: (_) => [
            PopupMenuItem(
              value: "Add",
              child: Text("Add"),
            ),
            PopupMenuItem(
              value: "C",
              child: Text("C"),
            ),
            PopupMenuItem(
              value: "F",
              child: Text("F"),
            ),
          ],
        )
      ],
    );

    return Scaffold(
        backgroundColor: myConstants.pageColor,
        appBar: appBar,
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            MyLocationWeather(),
            CitiesWeather("Some"),
          ],
        ));
  }
}
