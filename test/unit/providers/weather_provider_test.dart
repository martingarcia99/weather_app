import 'package:bondy_test/models/weather.dart';
import 'package:bondy_test/providers/weather_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';

class MockWeatherService extends Mock {
  Future<Weather> getWeatherByCity(String city) async {
    return Weather(
      city: "Madrid",
      currentTemp: 15,
      maxTemp: 20,
      minTemp: 10,
      weatherDesc: "Clear",
      weatherCode: 113,
      humidity: 55,
      pressure: 1012,
      windSpeed: 10,
      visibility: 10,
      uvIndex: 3,
      date: DateFormat('d MMM, yyyy').format(DateTime.now()),
    );
  }
}

void main() {
  group('Weather Provider', () {
    test('load weather correctly', () async {
      final provider = WeatherProvider();
      await provider.getWeather("Madrid");

      expect(provider.weather, isNotNull);
      expect(provider.isLoading, false);
      expect(provider.errorMessage, '');
    });

    test('handles error when city does not exist', () async {
      final provider = WeatherProvider();
      await provider.getWeather("UnknownCity");

      expect(provider.weather, isNull);
      expect(provider.isLoading, false);
      expect(provider.errorMessage, 'City not found');
    });
  });
}
