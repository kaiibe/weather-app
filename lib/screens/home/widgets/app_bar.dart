import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

import '../widgets/new_cities_picker.dart';

class CustomAppBar {
  final Function addNewCity;
  BuildContext ctx;

  CustomAppBar(this.addNewCity, this.ctx);

  Constants myConstants = Constants();

  Widget getTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //width: size.width,
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
    ];
  }
}
