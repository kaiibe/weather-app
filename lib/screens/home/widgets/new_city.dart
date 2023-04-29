// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class NewCity extends StatefulWidget {
  final Function addNewCity;
  const NewCity(this.addNewCity, {Key key}) : super(key: key);

  @override
  State<NewCity> createState() => _NewCityState();
}

class _NewCityState extends State<NewCity> {
  Constants myConstants = Constants();

  @override
  Widget build(BuildContext context) {
    String city;

    return Material(
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(20),
        color: myConstants.pageColor.withOpacity(1),
        child: Column(
          children: [
            CSCPicker(
              onCountryChanged: (value) => {},
              onStateChanged: (value) => {},
              onCityChanged: (value) => {city = value},
              layout: Layout.vertical,
              showStates: false,
              flagState: CountryFlag.DISABLE,
              dropdownDecoration: BoxDecoration(
                color: myConstants.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              disabledDropdownDecoration: BoxDecoration(
                color: myConstants.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              selectedItemStyle: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: "RussoOne",
              ),
              dropdownHeadingStyle: TextStyle(
                color: Colors.black,
                fontFamily: "RussoOne",
                fontSize: 20,
              ),
              dropdownItemStyle: TextStyle(color: Colors.black),
              dropdownDialogRadius: 10.0,
              searchBarRadius: 10.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CupertinoButton(
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RussoOne",
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if (city != null) {
                      widget.addNewCity(city);
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
