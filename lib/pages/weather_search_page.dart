// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/weather_page.dart';
import 'package:flutter_weather_app/util/colors.dart';
import 'package:flutter_weather_app/util/my_search_button.dart';
import 'package:flutter_weather_app/util/my_text_field.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        shadowColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)
        ),

      ),
      
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image.asset('lib/icons/weather-search.png'),
            MyTextField(),
            MySearchButton()
          ],
        ),
      ),
    );
  }
}