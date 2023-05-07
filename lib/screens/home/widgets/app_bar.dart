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
          ? SizedBox(
              child: PullDownButton(
                itemBuilder: (context) => [
                  PullDownMenuItem(
                    title: 'Edit List',
                    onTap: () {
                      editMode();
                    },
                    itemTheme: PullDownMenuItemTheme(
                      textStyle: TextStyle(
                          color: myConstants.titleColor.withOpacity(1)),
                    ),
                    icon: Icons.edit,
                  ),
                  const PullDownMenuDivider(
                    color: Colors.black,
                  ),
                  PullDownMenuItem.selectable(
                    selected: isCelsius,
                    title: 'Celsius',
                    onTap: () {
                      changeTemperature("C");
                    },
                    itemTheme: PullDownMenuItemTheme(
                      textStyle: TextStyle(
                          color: myConstants.titleColor.withOpacity(1)),
                    ),
                  ),
                  PullDownMenuItem.selectable(
                    title: 'Fahrenheit',
                    selected: isFahrenheit,
                    onTap: () {
                      changeTemperature("F");
                    },
                    itemTheme: PullDownMenuItemTheme(
                      textStyle: TextStyle(
                          color: myConstants.titleColor.withOpacity(1)),
                    ),
                  ),
                ],
                routeTheme: PullDownMenuRouteTheme(
                    backgroundColor: myConstants.primaryColor),
                buttonBuilder: (context, showMenu) => CupertinoButton(
                  onPressed: showMenu,
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.ellipsis_circle,
                    color: Colors.white,
                  ),
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
