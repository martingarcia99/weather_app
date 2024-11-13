import 'package:bondy_test/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bondy_test/providers/weather_provider.dart';
import 'package:bondy_test/widgets/weather_default_card.dart';
import 'package:bondy_test/widgets/weather_error.dart';
import 'package:bondy_test/widgets/weather_card.dart';
import 'package:bondy_test/widgets/city_input.dart';
import 'package:bondy_test/models/weather.dart';

class MockWeatherProvider extends ChangeNotifier implements WeatherProvider {
  @override
  bool isLoading = false;
  
  @override
  String errorMessage = '';
  
  @override
  Weather? weather;
  
  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
  
  void setErrorMessage(String message) {
    errorMessage = message;
    notifyListeners();
  }
  
  void setWeather(Weather weatherData) {
    weather = weatherData;
    notifyListeners();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('WeatherScreen Widget Tests', () {
    late MockWeatherProvider mockProvider;

    setUp(() {
      mockProvider = MockWeatherProvider();
    });

    Widget createTestWidget() {
      return ChangeNotifierProvider<WeatherProvider>.value(
        value: mockProvider,
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      );
    }

    testWidgets('Shows WeatherDefaultCard when there is no weather data',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      expect(find.byType(WeatherDefaultCard), findsOneWidget);
      expect(find.byType(CityInput), findsOneWidget);
    });

    testWidgets('Shows CircularProgressIndicator when loading',
      (WidgetTester tester) async {
      mockProvider.setLoading(true);
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byKey(const Key('loadingIndicator')), findsOneWidget);
      });

    testWidgets('Shows WeatherCard with correct weather data',
        (WidgetTester tester) async {
      final weatherData = Weather(
        city: 'New York',
        currentTemp: 20.0,
        maxTemp: 25.0,
        minTemp: 15.0,
        weatherDesc: 'Sunny',
        weatherCode: 800,
        humidity: 60,
        pressure: 1012,
        windSpeed: 10.0,
        visibility: 5.0,
        uvIndex: 3,
        date: '13 Nov, 2023',
      );
      mockProvider.setWeather(weatherData);
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byType(WeatherCard), findsOneWidget);
    });

    testWidgets('Shows WeatherError when there is an error message',
        (WidgetTester tester) async {
      mockProvider.setErrorMessage('City not found');
      await tester.pumpWidget(createTestWidget());
      await tester.pump();
      expect(find.byType(WeatherError), findsOneWidget);
      expect(find.text('City not found'), findsOneWidget);
    });
  });
}
