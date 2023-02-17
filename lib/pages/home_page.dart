import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/SearchPage.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherDate;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search_page();
                }));
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!
              ], begin: Alignment.topCenter,
                 end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(Provider.of<WeatherProvider>(context).cityName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      )),
                  Text('Updated at : ${weatherData!.date}',
                      style: TextStyle(fontSize: 23)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text('${weatherData!.temp.toInt()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          )),
                      Column(
                        children: [
                          Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                          Text('maxTemp : ${weatherData!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(weatherData!.weatherStateName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      )),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
