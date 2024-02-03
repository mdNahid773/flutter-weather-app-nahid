// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/colors.dart';

class MySearchButton extends StatelessWidget {
  const MySearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: 158,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: dropShadow,
            blurRadius: 10,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: Center(
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
