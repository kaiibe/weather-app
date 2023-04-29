import 'package:flutter/material.dart';

import '../../../models/weather_model.dart';
import '../../../models/constants.dart';
import '../../detailed_weather/detailed_weather.dart';

class UserCitiesList extends StatefulWidget {
  final List<String> myCities;
  final bool isCelsius;

  const UserCitiesList(this.myCities, this.isCelsius, {Key key}) : super(key: key);

  @override
  State<UserCitiesList> createState() => _UserCitiesListState();
}

void _selectedDetailedWeather(BuildContext context, WeatherModel data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((ctx) => DetailedWeather(data)),
    ),
  );
}

class _UserCitiesListState extends State<UserCitiesList> {
  Future<WeatherModel> getWeatherData(String city) async {
    final data = WeatherModel(city: city);
    await data.getWeatherData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    List<Widget> containers = [];
    for (int index = 0; index < widget.myCities.length; index++) {
      final data = getWeatherData(widget.myCities[index]);
      containers.add(
        FutureBuilder<WeatherModel>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return InkWell(
                onTap: () {
                  _selectedDetailedWeather(context, data);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: size.width,
                    height: 110,
                    decoration: BoxDecoration(
                      color: myConstants.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 10,
                          left: 15,
                          child: Text(
                            widget.myCities[index],
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'RussoOne',
                                color: myConstants.titleColor),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 15,
                          child: Text(
                            snapshot.data.time,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'RussoOne',
                                color: myConstants.titleColor),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.isCelsius ? snapshot.data.celsiusTemperature : snapshot.data.fahrenheitTemperature,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'RussoOne',
                                    color: myConstants.titleColor),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.weatherCondition,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'RussoOne',
                                    color: myConstants.titleColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      );
    }

    return Column(children: containers);
  }
}
