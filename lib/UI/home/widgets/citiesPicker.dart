import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityPicker extends StatelessWidget {
  const CityPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [],
      ),
    );
  }
}
