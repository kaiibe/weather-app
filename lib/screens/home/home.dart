import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/constants.dart';

import '../../server/geolocator.dart';

import './widgets/app_bar.dart';
import './widgets/user_cities_list.dart';
import './widgets/current_weather.dart';
import './widgets/add_new_city_card.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<String> _myCities = [
  "Dushanbe",
  "Dubai",
  "Moscow",
];

bool isCelsius = true;
bool isEditMode = false;

class _HomeState extends State<Home> {
  final GeolocatorController geolocator =
      Get.put(GeolocatorController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    void addNewCity(String city) {
      if (city != "" && city != "None" && !_myCities.contains(city)) {
        setState(() {
          _myCities.add(city);
        });
      }
    }

    void changeTemperature(String condition) {
      if (isCelsius && condition == 'F') {
        setState(() {
          isCelsius = false;
        });
      } else if (!isCelsius && condition == "C") {
        setState(() {
          isCelsius = true;
        });
      }
    }

    void editMode() {
      if (!isEditMode) {
        setState(() {
          isEditMode = true;
        });
      } else {
        setState(() {
          isEditMode = false;
        });
      }
    }

    void deleteCity(String city) {
      setState(() {
        _myCities.remove(city);
      });
    }

    final appBar = CustomAppBar(addNewCity, changeTemperature, editMode,
        isCelsius, isEditMode, context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        CurrentWeather(isCelsius, isEditMode),
                        UserCitiesList(
                            deleteCity, _myCities, isCelsius, isEditMode),
                        isEditMode
                            ? AddNewCityBlank(addNewCity)
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
