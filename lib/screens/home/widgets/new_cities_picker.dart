import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

class NewCitiesPicker extends StatelessWidget {
  final Function addNewCity;
  const NewCitiesPicker(this.addNewCity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    String selectedCity = "";

    const List<String> cities = [
      'None',
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
      color: myConstants.pageColor.withOpacity(1),
      height: 250,
      child: Column(
        children: [
          SizedBox(
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
          SizedBox(
            height: 100,
            child: CupertinoButton(
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                addNewCity(selectedCity);
                selectedCity = "";
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
