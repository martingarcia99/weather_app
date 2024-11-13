import 'package:bondy_test/models/functions/weather_icon_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('getWeatherIcon', () {
    test('Returns the correct icon for a known weather code', () {
      expect(getWeatherIcon(113), 'assets/images/sunny.png');
      expect(getWeatherIcon(116), 'assets/images/cloudy.png');
      expect(getWeatherIcon(143), 'assets/images/drizzle.png');
      expect(getWeatherIcon(386), 'assets/images/storm.png');
      expect(getWeatherIcon(179), 'assets/images/snow.png');
    });

    test('Returns default icon for unknown weather code', () {
      expect(getWeatherIcon(999), 'assets/images/cloudy.png');
    });
  });

  group('getBackgroundColor', () {
    test('Returns the correct background color for a known weather code', () {
      expect(getBackgroundColor(113), Colors.yellow.shade600);
      expect(getBackgroundColor(116), Colors.blue.shade100);
      expect(getBackgroundColor(143), Colors.blueGrey.shade200);
      expect(getBackgroundColor(386), Colors.deepPurple.shade500);
      expect(getBackgroundColor(338), Colors.lightBlue.shade700);
    });

    test('Returns default background color for an unknown weather code', () {
      expect(getBackgroundColor(999), Colors.grey.shade400);
    });
  });
}
