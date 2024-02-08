import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/network.dart';
import 'package:flutter_weather_app/pages/weather_page.dart';
//import '../services/network.dart';
//import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//Location location = Location();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  var weatherData = '';
  @override
  void initState() {
    super.initState();
    getLocationData();
    //LocationScreen(). =;
  }

  void getLocationData() async {
    await getCityWeather("");
  }

  //method to get Dhaka weather
  Future<dynamic> getCityWeather(String cityName) async {
    //Location location = Location();
    const String weatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=23.7104&lon=90.4074&appid=5a18fc6e52dc7342ee016a20e95a106c&units=metric";
    NetworkHelper networkHelper = NetworkHelper(weatherUrl);

    weatherData = await networkHelper.getData();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
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
        child: const Center(
          child: SpinKitDoubleBounce(
            color: Color.fromARGB(255, 255, 176, 176),
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
