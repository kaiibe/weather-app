import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/constants.dart';

import '../../server/geolocator.dart';

import './widgets/app_bar.dart';
import 'widgets/user_cities_list.dart';
import './widgets/current_weather.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


final List<String> _myCities = [
  "Lviv",
  "Seoul",
  "Potsdam",
  "Dushanbe",
  "Dubai",
];

class _HomeState extends State<Home> {
  final GeolocatorController geolocator =
      Get.put(GeolocatorController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    void addNewCity(String city) {
      if (city != "" && city != "None") {
        setState(() {
          _myCities.add(city);
        });
      }
    }

    final appBar = CustomAppBar(addNewCity, context);

    return Scaffold(
      backgroundColor: myConstants.pageColor.withOpacity(1),
      appBar: AppBar(
        backgroundColor: myConstants.pageColor,
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 0,
        title: appBar.getTitle(),
        actions: appBar.getActions(),
      ),

      body: SafeArea(
        child: Obx(
          () => geolocator.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      children: [
                        const CurrentWeather(),
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
