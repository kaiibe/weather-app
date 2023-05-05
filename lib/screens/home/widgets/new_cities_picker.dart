// ignore_for_file: library_private_types_in_public_api

import 'package:csc_picker/csc_picker.dart';
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

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: myConstants.primaryColor.withOpacity(1),
      child: Container(
          height: 400,
          width: size.width,
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          decoration: BoxDecoration(
            color: myConstants.primaryColor.withOpacity(1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CSCPicker(
                layout: Layout.vertical,
                onCountryChanged: (value) {
                  countryValue = value;
                },
                onStateChanged: (value) {
                  stateValue = value;
                },
                onCityChanged: (value) {
                  cityValue = value;
                },
                flagState: CountryFlag.DISABLE,
                dropdownDecoration: BoxDecoration(
                  color: myConstants.pageColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledDropdownDecoration: BoxDecoration(
                  color: myConstants.pageColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedItemStyle:
                    TextStyle(color: myConstants.titleColor.withOpacity(1)),
              ),
              const Spacer(),
              Expanded(
                child: CupertinoButton(
                  onPressed: () {
                    if (cityValue != "" && cityValue != null) {
                      widget.addNewCity(cityValue);
                    }
                    cityValue = "";
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: myConstants.titleColor.withOpacity(1),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
