// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/models/constants.dart';
import '../../models/city_weather_model.dart';

import '../../controllers/global_controller.dart';

import 'widgets/user_cities_list.dart';
import './widgets/new_cities_picker.dart';
import './widgets/current_weather.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<CitiesWeatherModel> _myCities = [
  CitiesWeatherModel("Potsdam"),
  CitiesWeatherModel("Dushanbe"),
  CitiesWeatherModel("Dubai"),
];

class _HomeState extends State<Home> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    void addNewCity(String city) {
      if (city != "" && city != "None") {
        setState(() {
          _myCities.add(CitiesWeatherModel(city));
        });
      }
    }

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
          children: const [
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
          color: myConstants.primaryColor.withOpacity(1),
          onSelected: (selectedValue) {
            if (selectedValue == "Add") {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return NewCitiesPicker(addNewCity);
                },
              );
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          itemBuilder: (_) => [
            const PopupMenuItem(
              textStyle: TextStyle(
                fontFamily: 'RussoOne',
                fontSize: 20,
              ),
              value: "Add",
              child: Text("Add"),
            ),
            const PopupMenuItem(
              textStyle: TextStyle(
                fontFamily: 'RussoOne',
                fontSize: 20,
              ),
              value: "C",
              child: Text("C"),
            ),
            const PopupMenuItem(
              textStyle: TextStyle(
                fontFamily: 'RussoOne',
                fontSize: 20,
              ),
              value: "F",
              child: Text("F"),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: myConstants.pageColor.withOpacity(1),
      appBar: appBar,
      //body: UserCitiesList(_myCities),
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    child: Column(
                      children: [
                        CurrentWeather(),
                        UserCitiesList(_myCities),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

// UserCitiesList(_myCities),
