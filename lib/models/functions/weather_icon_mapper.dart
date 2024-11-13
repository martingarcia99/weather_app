import 'dart:ui';

import 'package:flutter/material.dart';

final Map<int, String> weatherIconMapper = {
  // Sunny or clear weather
  113: 'assets/images/sunny.png',

  // Cloudy or overcast weather
  116: 'assets/images/cloudy.png',
  119: 'assets/images/cloudy.png',
  122: 'assets/images/cloudy.png',

  // Drizzle
  143: 'assets/images/drizzle.png',
  263: 'assets/images/drizzle.png',
  266: 'assets/images/drizzle.png',
  281: 'assets/images/drizzle.png',
  284: 'assets/images/drizzle.png',

  // Fog and mist
  248: 'assets/images/fog.png',
  260: 'assets/images/fog.png',

  // Rain
  176: 'assets/images/rain.png',
  293: 'assets/images/rain.png',
  296: 'assets/images/rain.png',
  299: 'assets/images/rain.png',
  302: 'assets/images/rain.png',
  305: 'assets/images/rain.png',
  308: 'assets/images/rain.png',
  311: 'assets/images/rain.png',
  314: 'assets/images/rain.png',
  353: 'assets/images/rain.png',
  356: 'assets/images/rain.png',
  359: 'assets/images/rain.png',
  386: 'assets/images/storm.png',

  // Snow
  179: 'assets/images/snow.png',
  323: 'assets/images/snow.png',
  326: 'assets/images/snow.png',
  329: 'assets/images/snow.png',
  332: 'assets/images/snow.png',
  335: 'assets/images/snow.png',
  338: 'assets/images/snow.png',
  368: 'assets/images/snow.png',
  371: 'assets/images/snow.png',
  395: 'assets/images/snow.png',

  // Storm
  200: 'assets/images/storm.png',
  227: 'assets/images/storm.png',
  230: 'assets/images/storm.png',
  389: 'assets/images/storm.png',
};

final Map<int, Color> weatherBackgroundColorMapper = {
  113: Colors.yellow.shade600,
  116: Colors.blue.shade100,
  119: Colors.grey.shade400,
  122: Colors.grey.shade600,
  143: Colors.blueGrey.shade200,
  176: Colors.lightBlue.shade200,
  179: Colors.lightBlue.shade100,
  182: Colors.lightBlue.shade300,
  185: Colors.blueGrey.shade100,
  200: Colors.deepPurple.shade300,
  227: Colors.blueGrey.shade400,
  230: Colors.blueGrey.shade700,
  248: Colors.blueGrey.shade300,
  260: Colors.blueGrey.shade500,
  263: Colors.lightBlue.shade100,
  266: Colors.lightBlue.shade200,
  281: Colors.lightBlue.shade400,
  284: Colors.blueGrey.shade400,
  293: Colors.blue.shade300,
  296: Colors.blue.shade400,
  299: Colors.blue.shade500,
  302: Colors.blue.shade600,
  305: Colors.blue.shade700,
  308: Colors.blue.shade800,
  311: Colors.lightBlue.shade500,
  314: Colors.lightBlue.shade600,
  317: Colors.blue.shade200,
  320: Colors.blue.shade300,
  323: Colors.lightBlue.shade200,
  326: Colors.lightBlue.shade300,
  329: Colors.lightBlue.shade400,
  332: Colors.lightBlue.shade500,
  335: Colors.lightBlue.shade600,
  338: Colors.lightBlue.shade700,
  350: Colors.blueGrey.shade300,
  353: Colors.blue.shade200,
  356: Colors.blue.shade400,
  359: Colors.blue.shade600,
  362: Colors.blueGrey.shade200,
  365: Colors.blueGrey.shade300,
  368: Colors.lightBlue.shade300,
  371: Colors.lightBlue.shade400,
  374: Colors.blueGrey.shade400,
  377: Colors.blueGrey.shade500, 
  386: Colors.deepPurple.shade500,
  389: Colors.deepPurple.shade700,
  392: Colors.deepPurple.shade500,
  395: Colors.deepPurple.shade700,
};

String getWeatherIcon(int weatherCode) {
  return weatherIconMapper[weatherCode] ?? 'assets/images/cloudy.png';
}

Color getBackgroundColor(int weatherCode) {
  return weatherBackgroundColorMapper[weatherCode] ?? Colors.grey.shade400;
}
