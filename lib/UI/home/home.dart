// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

    final List<String> cities = [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix',
      'Philadelphia',
      'San Antonio',
      'San Diego',
      'Dallas',
      'San Jose',
    ];
    String selectedCity = "";

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
                  return Container(
                    color: myConstants.pageColor,
                    height: 250,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            children: List<Widget>.generate(cities.length,
                                (int index) {
                              return Center(
                                child: Text(
                                  cities[index],
                                  style:
                                      TextStyle(color: myConstants.titleColor),
                                ),
                              );
                            }),
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                selectedCity = cities[index];
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          child: CupertinoButton(
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                print(selectedCity);
                                Navigator.of(context).pop(selectedCity);
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  );
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

// BottomPicker(
//                 title: "Choose your country",
//                 items: [
//                   Text("Morocco"),
//                   Text("Something"),
//                 ],
//                 backgroundColor: myConstants.titleColor.withOpacity(0.8),
//                 titleStyle: TextStyle(
//                     color: Colors.black, fontFamily: 'RussoOne', fontSize: 25),
//                 pickerTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'RussoOne',
//                   fontSize: 20,
//                 ),
//                 bottomPickerTheme: BottomPickerTheme.morningSalad,
//                 onSubmit: (index) {
//                   print(index);
//                 },
//               ).show(context);
