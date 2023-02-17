import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class Search_page extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel? weather =
                  await services.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: Text("Search"),
                suffixIcon: GestureDetector(
                    onTap: ()async{
                      WeatherServices services = WeatherServices();
                      WeatherModel? weather =
                      await services.getWeather(cityName: cityName!);

                      Provider.of<WeatherProvider>(context, listen: false).weatherData =
                          weather;
                      Provider.of<WeatherProvider>(context, listen: false).cityName =
                          cityName;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(),
                hintText: "Search a City"),
          ),
        ),
      ),
    );
  }
}
