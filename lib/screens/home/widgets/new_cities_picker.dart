import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../models/constants.dart';

class NewCitiesPicker extends StatefulWidget {
  final Function addNewCity;

  const NewCitiesPicker(this.addNewCity, {Key key}) : super(key: key);

  @override
  State<NewCitiesPicker> createState() => _NewCitiesPickerState();
}

class _NewCitiesPickerState extends State<NewCitiesPicker> {
  String cityValue = "";
  List<String> citySuggestions = [];

  Future<void> fetchCitySuggestions(String query, String apiKey) async {
    if (query.isEmpty) {
      setState(() {
        citySuggestions = [];
      });
      return;
    }

    final url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=5&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final suggestions = data
            .map((city) => '${city['name']}, ${city['country']}')
            .toSet() // Convert to set to remove duplicates
            .toList();
        setState(() {
          citySuggestions = suggestions;
        });
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;

    String apiKey = myConstants.apiKey;

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: myConstants.primaryColor.withOpacity(1),
      child: Container(
        height: 500,
        width: size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: myConstants.pageColor.withOpacity(1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: CupertinoTextField(
                onChanged: (value) {
                  cityValue = value;
                  if (cityValue == "") {
                    setState(() {
                      citySuggestions = [];
                    });
                  } else {
                    fetchCitySuggestions(value, apiKey);
                  }
                },
                padding: const EdgeInsets.only(left: 16.0),
                style: TextStyle(
                  color: myConstants.titleColor.withOpacity(1),
                ),
                placeholder: "Type location...",
                placeholderStyle: TextStyle(
                  color: myConstants.titleColor,
                  fontFamily: 'RussoOne',
                ),
                decoration: BoxDecoration(
                  color: myConstants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: citySuggestions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          citySuggestions[index],
                          style: TextStyle(
                            fontFamily: "RussoOne",
                            color: myConstants.titleColor.withOpacity(0.9),
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          final selectedCity =
                              citySuggestions[index].split(',')[0].trim();
                          widget.addNewCity(selectedCity);
                          Navigator.pop(context);
                        },
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
