import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

import '../widgets/new_city.dart';

class CustomAppBar {
  final Function addNewCity;
  final Function changeTemperature;
  BuildContext ctx;

  CustomAppBar(this.addNewCity, this.changeTemperature, this.ctx);

  Constants myConstants = Constants();

  Widget getTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Weather App",
            style: TextStyle(
              fontFamily: 'RussoOne',
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getActions() {
    return [
      PopupMenuButton(
        color: myConstants.primaryColor.withOpacity(1),
        onSelected: (selectedValue) {
          if (selectedValue == "Add") {
            showCupertinoModalPopup(
              context: ctx,
              builder: (BuildContext context) {
                return NewCity(addNewCity);
              },
            );
          } else if (selectedValue == "C") {
            changeTemperature("C");
          } else if (selectedValue == "F") {
            changeTemperature("F");
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
    ];
  }
}
