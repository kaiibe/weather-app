// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

class NewCitiesPicker extends StatefulWidget {
  final Function addNewCity;
  const NewCitiesPicker(this.addNewCity, {Key key}) : super(key: key);

  @override
  _NewCitiesPickerState createState() => _NewCitiesPickerState();
}

class _NewCitiesPickerState extends State<NewCitiesPicker> {
  Constants myConstants = Constants();
  String selectedCity = "";
  List<String> cities = [
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
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: myConstants.pageColor.withOpacity(1),
      height: 400,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 40,
                width: 400,
                child: CupertinoTextField(
                  style: TextStyle(
                    color: myConstants.titleColor,
                  ),
                  decoration: BoxDecoration(
                    color: myConstants.primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      CupertinoIcons.search,
                      color: myConstants.titleColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredCities = cities
                          .where((city) =>
                              city.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      if (filteredCities.isNotEmpty) {
                        selectedCity = filteredCities[0];
                      } else {
                        selectedCity = "";
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 150,
                child: CupertinoPicker(
                  itemExtent: 40,
                  children:
                      List<Widget>.generate(filteredCities.length, (int index) {
                    return Center(
                      child: Text(
                        filteredCities[index],
                        style: TextStyle(color: myConstants.titleColor),
                      ),
                    );
                  }),
                  onSelectedItemChanged: (int index) {
                    selectedCity = filteredCities[index];
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 20,
              child: CupertinoButton(
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  widget.addNewCity(selectedCity);
                  selectedCity = "";
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
