import 'package:flutter/material.dart';

import '../../../models/constants.dart';

AppBar MyAppBar(context) {
  Size size = MediaQuery.of(context).size;
  Constants myConstants = Constants();
  return AppBar(
      backgroundColor: myConstants.pageColor,
      elevation: 0.0,
      centerTitle: false,
      titleSpacing: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Weather",
              style: TextStyle(
                fontFamily: 'RussoOne',
              ),
            ),
          ],
        ),
      ),
    );
}
