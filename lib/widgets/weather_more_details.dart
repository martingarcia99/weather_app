import 'package:bondy_test/widgets/weather_more_details_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/weather.dart';


class WeatherMoreDetails extends StatelessWidget {
  final Weather weather;

  const WeatherMoreDetails({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'UV INDEX',
                value: weather.uvIndex.toString(),
                icon: Icons.sunny,
                iconColor: Colors.yellow,
              ),
            ),
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'WIND',
                value: '${weather.windSpeed} m/h',
                icon: FontAwesomeIcons.wind,
                iconColor: Colors.indigoAccent,
              ),
            ),
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'HUMIDITY',
                value: '${weather.humidity.toInt()}%',
                icon: Icons.water_drop,
                iconColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'MIN TEMP',
                value: '${weather.minTemp.toString()} °C',
                icon: WeatherIcons.thermometer,
                iconColor: Colors.blueGrey,
              ),
            ),
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'MAX TEMP',
                value: '${weather.maxTemp.toString()} °C',
                icon: WeatherIcons.thermometer,
                iconColor: Colors.redAccent,
              ),
            ),
            Expanded(
              child: WeatherMoreDetailsItem(
                title: 'PRESSURE',
                value: '${weather.pressure.toInt()} hPa',
                icon: WeatherIcons.barometer,
                iconColor: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
