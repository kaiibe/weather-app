// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/UI/home/widgets/citiesPicker.dart';

import '../../models/city_weather_model.dart';
import '/models/constants.dart';
import 'widgets/user_cities.dart';

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

    List<String> editOptions = ["Edit", "C", "F"];

    // final List<CityWeatherModel> citiesWeather = [
    //   CityWeatherModel("My Location", "Potsdam", 18, "Partly Cloudy"),
    //   CityWeatherModel("Berlin", "Berlin", 13, "Cloudy")
    // ];

    String selectedCity = "";
    void setSelectedCity(city) {
      selectedCity = city;
    }

    List<String> myCities = [
      "MyLocation",
      "Berlin",
      "Dushanbe",
      "Potsdam",
    ];

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
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return CitiesPicker(setSelectedCity);
                },
              );
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
        ),
      ],
    );

    final homeBody = CitiesWeather(myCities: myCities);

    return Scaffold(
      backgroundColor: myConstants.pageColor,
      appBar: appBar,
      body: homeBody,
    );
  }
}
// wrapped 