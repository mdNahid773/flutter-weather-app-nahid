// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/weather_search_page.dart';
import 'package:flutter_weather_app/util/colors.dart';
import 'package:intl/intl.dart';
//import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatefulWidget {
  final Map<String, dynamic> locationWeather;
  const WeatherPage(
      {super.key, required this.locationWeather});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherStatus = "";
  String weatherIcon = "";
  int temperature = 0;
  String location = "";
  String country = "";

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(weatherData) {
    setState(() {
      weatherStatus = weatherData['weather'][0]['main'];
      weatherIcon =
          "${"https://openweathermap.org/img/wn/" + weatherData["weather"][0]["icon"]}@2x.png";

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      location = weatherData['name'];
      country = weatherData['sys']['country'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Weather',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: bgColor,
        shadowColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WeatherSearchPage(),
              ));
            },
            icon: Icon(Icons.search),
            iconSize: 30,
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          //height: 290,
          width: 250,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: dropShadow, blurRadius: 10)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //'SUNNY',
                weatherStatus.toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: fontColor,
                    letterSpacing: 1),
              ),
              Image.network(
                weatherIcon,
                width: 120,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$temperature° c',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: fontColor),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$location, $country',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: fontColor,
                  //letterSpacing: 1
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                //'Friday, 16 | 09:41 am',
                '${DateFormat('EEEE, d').format(DateTime.now())} | ${DateFormat('h:mm a').format(DateTime.now())}',
                style:
                    TextStyle(fontSize: 16, color: fontColor, letterSpacing: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
