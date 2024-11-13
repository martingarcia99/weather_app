import 'package:bondy_test/models/functions/weather_icon_mapper.dart';
import 'package:bondy_test/utils/animations/slide_transition_animation.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherMainDetails extends StatelessWidget {
  final Weather weather;

  const WeatherMainDetails({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getBackgroundColor(weather.weatherCode),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.city,
              style: const TextStyle(
                fontSize: 40, 
                fontWeight: 
                FontWeight.bold, 
                color: Colors.white
              ),
            ),
            const SizedBox(height: 8),
            Text(weather.date, style: const TextStyle(color: Colors.white, fontSize: 20 )),
            const SizedBox(height: 8),
            SlideTransitionAnimation(
              duration: const Duration(milliseconds:900),
              begin: const Offset(0.4,0),
              end: Offset.zero,
              curve: Curves.easeIn,
              child: SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage(getWeatherIcon(weather.weatherCode)), 
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain)
                )
            ),
            Text(
              '${weather.currentTemp.round()} °C',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              weather.weatherDesc,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
