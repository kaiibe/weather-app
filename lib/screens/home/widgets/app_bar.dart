import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../models/constants.dart';

class CustomAppBar {
  final Function addNewCity;
  final Function changeTemperature;
  final bool isCelsius;
  final Function editMode;
  final bool isEditMode;
  BuildContext ctx;

  CustomAppBar(this.addNewCity, this.changeTemperature, this.editMode,
      this.isCelsius, this.isEditMode, this.ctx);

  Constants myConstants = Constants();

  bool isFahrenheit = false;

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
    if (!isCelsius) {
      isFahrenheit = true;
    }
    return [
      !isEditMode
          ? PullDownButton(
              itemBuilder: (context) => [
                PullDownMenuItem(
                  title: 'Edit List',
                  onTap: () {
                    editMode();
                  },
                  icon: Icons.edit,
                ),
                const PullDownMenuDivider.large(),
                PullDownMenuItem.selectable(
                  selected: isCelsius,
                  title: 'Celsius',
                  onTap: () {
                    changeTemperature("C");
                  },
                ),
                PullDownMenuItem.selectable(
                  title: 'Fahrenheit',
                  selected: isFahrenheit,
                  onTap: () {
                    changeTemperature("F");
                  },
                ),
              ],
              buttonBuilder: (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.ellipsis_circle,
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () {
                  editMode();
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "RussoOne",
                    color: Colors.white,
                  ),
                ),
              ),
            )
    ];
  }
}






// PopupMenuButton(
      //   color: myConstants.primaryColor.withOpacity(1),
      //   onSelected: (selectedValue) {
          // if (selectedValue == "Add") {
          //   showCupertinoModalPopup(
          //     context: ctx,
          //     builder: (BuildContext context) {
          //       return NewCitiesPicker(addNewCity);
          //     },
          //   );
      //     } else if (selectedValue == "C") {
      //       changeTemperature("C");
      //     } else if (selectedValue == "F") {
      //       changeTemperature("F");
      //     }
      //   },
      //   icon: const Icon(
      //     Icons.menu,
      //     color: Colors.white,
      //   ),
      //   itemBuilder: (_) => [
      //     const PopupMenuItem(
      //       textStyle: TextStyle(
      //         fontFamily: 'RussoOne',
      //         fontSize: 20,
      //       ),
      //       value: "Add",
      //       child: Text("Add"),
      //     ),
      //     PopupMenuItem(
      //       textStyle: const TextStyle(
      //         fontFamily: 'RussoOne',
      //         fontSize: 20,
      //       ),
      //       value: "C",
      //       child: Row(
      //         children: [
      //           const Text("°C"),
      //           const Spacer(),
      //           isCelsius ? const Icon(Icons.check) : const Text(""),
      //         ],
      //       ),
      //     ),
      //     PopupMenuItem(
      //       textStyle: const TextStyle(
      //         fontFamily: 'RussoOne',
      //         fontSize: 20,
      //       ),
      //       value: "F",
      //       child: Row(
      //         children: [
      //           const Text("°F"),
      //           const Spacer(),
      //           isCelsius ? const Text("") : const Icon(Icons.check),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),