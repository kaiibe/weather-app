import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/models/constants.dart';
import 'widgets/user_cities_list.dart';
import './widgets/new_cities_picker.dart';
import '../../models/city_weather_model.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final List<CitiesWeatherModel> _myCities = [
  CitiesWeatherModel("My Location"),
  CitiesWeatherModel("Berlin"),
  CitiesWeatherModel("Dushanbe"),
  CitiesWeatherModel("Potsdam"),
];

class _HomeState extends State<Home> {
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
      body: UserCitiesList(_myCities),
    );
  }
}
