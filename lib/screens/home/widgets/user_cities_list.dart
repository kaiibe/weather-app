import 'package:flutter/material.dart';

import '../../../models/weather_model.dart';
import '../../../models/constants.dart';
import '../../detailed_weather/detailed_weather.dart';

class UserCitiesList extends StatefulWidget {
  final Function deleteCity;
  final List<String> myCities;
  final bool isCelsius;
  final bool isEditMode;

  const UserCitiesList(
      this.deleteCity, this.myCities, this.isCelsius, this.isEditMode,
      {Key key})
      : super(key: key);

  @override
  State<UserCitiesList> createState() => _UserCitiesListState();
}

void _selectedDetailedWeather(
    BuildContext context, WeatherModel data, bool isCelsius) {
  if (data.gotResponse == true) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => DetailedWeather(data, isCelsius)),
      ),
    );
  }
}

class _UserCitiesListState extends State<UserCitiesList> {
  Map<String, WeatherModel> cachedWeatherData = {};

  Future<WeatherModel> getWeatherData(String city) async {
    if (cachedWeatherData.containsKey(city)) {
      return cachedWeatherData[city];
    } else {
      final data = WeatherModel(city: city);
      await data.getWeatherData();
      cachedWeatherData[city] = data;
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    List<Widget> containers = [];

    Widget citiesList(index, snapshot) {
      return Container(
        margin: const EdgeInsets.all(10),
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
                    widget.isCelsius
                        ? snapshot.data.celsiusTemperature
                        : snapshot.data.fahrenheitTemperature,
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
            widget.isEditMode
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        widget.deleteCity(widget.myCities[index]);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.isEditMode
                ? Positioned(
                    bottom: 8,
                    right: 35,
                    child: IconButton(
                      onPressed: () {
                        widget.deleteCity(widget.myCities[index]);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    }

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
                    if (!widget.isEditMode) {
                      _selectedDetailedWeather(context, data, widget.isCelsius);
                    }
                  },
                  child: widget.isEditMode
                      ? Dismissible(
                          key: Key(widget.myCities[index]),
                          onDismissed: (direction) {
                            widget.deleteCity(widget.myCities[index]);
                          },
                          background: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          child: citiesList(index, snapshot),
                        )
                      : citiesList(index, snapshot));
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
