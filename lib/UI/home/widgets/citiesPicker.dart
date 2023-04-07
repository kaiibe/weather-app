// ignore_for_file: sized_box_for_whitespace, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/constants.dart';

class CitiesPicker extends StatelessWidget {
  Function setSelectedCity;
  CitiesPicker(this.setSelectedCity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    String selectedCity;

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

    return Container(
      color: myConstants.pageColor,
      height: 250,
      child: Column(
        children: [
          Container(
            height: 150,
            child: CupertinoPicker(
              itemExtent: 40,
              children: List<Widget>.generate(cities.length, (int index) {
                return Center(
                  child: Text(
                    cities[index],
                    style: TextStyle(color: myConstants.titleColor),
                  ),
                );
              }),
              onSelectedItemChanged: (int index) {
                selectedCity = cities[index];
              },
            ),
          ),
          Container(
            height: 100,
            child: CupertinoButton(
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setSelectedCity(selectedCity);
                print(selectedCity);
                Navigator.of(context).pop(selectedCity);
              },
            ),
          )
        ],
      ),
    );
  }
}
