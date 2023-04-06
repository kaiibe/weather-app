// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../models/constants.dart';

AppBar myAppBar(context) {
  Size size = MediaQuery.of(context).size;
  Constants myConstants = Constants();
  final cities = ["Berlin", "London"];
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
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     DropdownButton(
          //       items: const [
          //         DropdownMenuItem(
          //           value: "Edit",
          //           child: Text("Edit"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Edit",
          //           child: Text("Edit"),
          //         ),
          //         DropdownMenuItem(
          //           value: "Edit",
          //           child: Text("Edit"),
          //         )
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    ),
    actions: <Widget>[
      PopupMenuButton(
        onSelected: (selectedValue) {
          print(selectedValue);
        },
        icon: Icon(Icons.menu),
        itemBuilder: (_) => [
          PopupMenuItem(
            value: "Add",
            child: Text("Add"),
          ),
          PopupMenuItem(
            value: "C",
            child: Text("C"),
          ),
          PopupMenuItem(
            value: "F",
            child: Text("F"),
          ),
        ],
      )
    ],
  );
}
