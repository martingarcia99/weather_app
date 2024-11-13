import 'package:bondy_test/widgets/weather_main_details.dart';
import 'package:bondy_test/widgets/weather_more_details.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherMainDetails(weather: weather),
        WeatherMoreDetails(weather: weather)
      ]
    );
  }
}
