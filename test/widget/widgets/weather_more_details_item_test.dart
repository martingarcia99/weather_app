import 'package:bondy_test/models/functions/weather_icon_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bondy_test/widgets/weather_more_details_item.dart';
import 'package:bondy_test/providers/weather_provider.dart';
import 'package:bondy_test/models/weather.dart';
import 'package:provider/provider.dart';

class MockWeatherProvider extends WeatherProvider {
  final Weather mockWeather;

  MockWeatherProvider(this.mockWeather);

  @override
  Weather? get weather => mockWeather;
}

void main() {
  group('WeatherMoreDetailsItem Widget Tests', () {
    final Weather testWeather = Weather(
      city: 'Test City',
      currentTemp: 25.5,
      maxTemp: 30.0,
      minTemp: 20.0,
      weatherDesc: 'Clear sky',
      weatherCode: 800,
      humidity: 50,
      pressure: 1013,
      windSpeed: 15.5,
      visibility: 10.0,
      uvIndex: 5,
      date: '13 Nov, 2024',
    );

    final weatherProvider = MockWeatherProvider(testWeather);

    testWidgets('WeatherMoreDetailsItem renders correctly', (WidgetTester tester) async {
      const String title = 'Humidity';
      const String value = '50%';
      const IconData icon = Icons.water_drop;
      const Color iconColor = Colors.blue;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<WeatherProvider>.value(value: weatherProvider),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WeatherMoreDetailsItem(
                title: title,
                value: value,
                icon: icon,
                iconColor: iconColor,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.byIcon(icon), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(find.text(value), findsOneWidget);
    });

    testWidgets('WeatherMoreDetailsItem applies correct color and styling', (WidgetTester tester) async {
      const String title = 'Wind Speed';
      const String value = '15.5 km/h';
      const IconData icon = Icons.air;
      const Color iconColor = Colors.green;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<WeatherProvider>.value(value: weatherProvider),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WeatherMoreDetailsItem(
                title: title,
                value: value,
                icon: icon,
                iconColor: iconColor,
              ),
            ),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      final backgroundColor = getBackgroundColor(weatherProvider.weather!.weatherCode).withOpacity(0.7);
      expect(card.color, backgroundColor);

      final iconWidget = tester.widget<Icon>(find.byIcon(icon));
      expect(iconWidget.color, iconColor);
      expect(iconWidget.size, 22);

      final titleText = tester.widget<Text>(find.text(title));
      expect(titleText.style?.color, Colors.grey[50]);
      expect(titleText.style?.fontWeight, FontWeight.bold);
      expect(titleText.style?.fontSize, 10);

      final valueText = tester.widget<Text>(find.text(value));
      expect(valueText.style?.color, Colors.white);
      expect(valueText.style?.fontWeight, FontWeight.bold);
    });

  });
}
