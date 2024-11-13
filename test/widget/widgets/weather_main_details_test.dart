import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bondy_test/models/weather.dart';
import 'package:bondy_test/widgets/weather_main_details.dart';
import 'package:bondy_test/utils/animations/slide_transition_animation.dart';
import 'package:bondy_test/models/functions/weather_icon_mapper.dart';

void main() {
  group('WeatherMainDetails Widget Tests', () {
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

    testWidgets('WeatherMainDetails renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherMainDetails(weather: testWeather),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.text('Test City'), findsOneWidget);
      expect(find.text('13 Nov, 2024'), findsOneWidget);
      expect(find.text('26 °C'), findsOneWidget);
      expect(find.text('Clear sky'), findsOneWidget);
    });

    testWidgets('WeatherMainDetails has correct styling and layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherMainDetails(weather: testWeather),
          ),
        ),
      );


      final card = tester.widget<Card>(find.byType(Card));
      expect(card.color, getBackgroundColor(testWeather.weatherCode));

      final cityText = tester.widget<Text>(find.text('Test City'));
      expect(cityText.style?.fontSize, 40);
      expect(cityText.style?.fontWeight, FontWeight.bold);
      expect(cityText.style?.color, Colors.white);

      final tempText = tester.widget<Text>(find.text('26 °C'));
      expect(tempText.style?.fontSize, 30);
      expect(tempText.style?.fontWeight, FontWeight.bold);
      expect(tempText.style?.color, Colors.white);

      final descText = tester.widget<Text>(find.text('Clear sky'));
      expect(descText.style?.fontSize, 25);
      expect(descText.style?.fontWeight, FontWeight.bold);
      expect(descText.style?.color, Colors.white);
    });

    testWidgets('WeatherMainDetails shows weather icon with SlideTransitionAnimation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherMainDetails(weather: testWeather),
          ),
        ),
      );

      expect(find.byType(SlideTransitionAnimation), findsOneWidget);

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);
      final image = tester.widget<Image>(imageFinder);
      expect(image.image, AssetImage(getWeatherIcon(testWeather.weatherCode)));
      expect(image.width, 200);
      expect(image.height, 200);
      expect(image.fit, BoxFit.contain);
    });
  });
}
