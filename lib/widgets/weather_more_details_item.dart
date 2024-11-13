import 'package:bondy_test/models/functions/weather_icon_mapper.dart';
import 'package:bondy_test/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WeatherMoreDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const WeatherMoreDetailsItem({
    required this.iconColor,
    required this.icon, 
    required this.value, 
    required this.title, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    
    return Card(
      color: getBackgroundColor(weatherProvider.weather!.weatherCode).withOpacity(0.7),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 22),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontWeight: FontWeight.bold,
                    fontSize: 10
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
