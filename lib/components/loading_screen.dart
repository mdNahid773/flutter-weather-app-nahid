import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/geo_location.dart';
import 'package:flutter_weather_app/components/network.dart';
import 'package:flutter_weather_app/pages/weather_page.dart';
//import '../services/network.dart';
//import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//Location location = Location();

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    //LocationScreen(). =;
  }

  void getLocationData() async {
    var weatherData = await getCityWeather("");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherPage(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  //method to get Dhaka weather
  Future<dynamic> getCityWeather(String cityName) async {
    //Location location = Location();
    final String weatherUrl =
        // "https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
      "https://api.openweathermap.org/data/2.5/weather?lat=23.7104&lon=90.4074&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
      //"https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
    NetworkHelper networkHelper = NetworkHelper('$weatherUrl');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/location_background.png'),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //       Colors.black.withOpacity(0.09),
        //       BlendMode.darken,
        //     ),
        //   ),
        // ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: const Color.fromARGB(255, 255, 176, 176),
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
