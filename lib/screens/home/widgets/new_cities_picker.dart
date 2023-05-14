import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

class NewCitiesPicker extends StatefulWidget {
  final Function addNewCity;
  const NewCitiesPicker(this.addNewCity, {Key key}) : super(key: key);

  @override
  State<NewCitiesPicker> createState() => _NewCitiesPickerState();
}

class _NewCitiesPickerState extends State<NewCitiesPicker> {
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();

    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: myConstants.primaryColor.withOpacity(1),
      child: Container(
          height: 500,
          width: size.width,
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          decoration: BoxDecoration(
            color: myConstants.pageColor.withOpacity(1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CupertinoTextField(
                onChanged: (value) {
                  cityValue = value;
                },
                placeholder: "Search by location",
              ),
              const Spacer(),
              Expanded(
                child: CupertinoButton(
                  onPressed: () {
                    cityValue = cityValue
                        .split(" ")
                        .map((word) => word.isNotEmpty
                            ? "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}"
                            : "")
                        .join(" ");
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
