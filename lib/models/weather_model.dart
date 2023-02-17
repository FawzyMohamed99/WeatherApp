import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String weatherStateName;
  double temp;
  double maxTemp;
  double minTemp;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        weatherStateName: jsonData['condition']['text'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }

  String getImage()
  {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor()
  {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.red;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.purple;
    } else {
      return Colors.pink;
    }
  }
}
