import 'package:flutter/cupertino.dart';

import '../../../models/constants.dart';

import '../widgets/new_cities_picker.dart';

class AddNewCityBlank extends StatelessWidget {
  final Function addNewCity;
  const AddNewCityBlank(this.addNewCity, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return NewCitiesPicker(addNewCity);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: size.width,
          height: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color: myConstants.primaryColor,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "RussoOne",
                  color: myConstants.titleColor),
            ),
          ),
        ),
      ),
    );
  }
}
