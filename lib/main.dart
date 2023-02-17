import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherDate == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherDate!
                .getThemeColor(),
      ),
      home: HomePage(),
      title: "Weather App ⛅",
    );
  }
}
