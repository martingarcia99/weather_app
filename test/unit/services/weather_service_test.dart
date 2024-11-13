import 'package:bondy_test/services/weather_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  group('getWeatherByCity', () {
    test('returns Weather object if the http call completes successfully', () async {
      final mockClient = MockClient((request) async {
        final mockResponse = {
          "nearest_area": [
            {
              "areaName": [
                {"value": "London"}
              ]
            }
          ],
          "current_condition": [
            {
              "temp_C": "15",
              "weatherDesc": [{"value": "Sunny"}],
              "weatherCode": "113",
              "humidity": "60",
              "pressure": "1012",
              "windspeedKmph": "10",
              "visibility": "10",
              "uvIndex": "5"
            }
          ],
          "weather": [
            {
              "maxtempC": "20",
              "mintempC": "10",
              "date": "2024-11-13"
            }
          ]
        };
        return http.Response(jsonEncode(mockResponse), 200);
      });

      final weather = await getWeatherByCity('London', client: mockClient);
      
      expect(weather.city, 'London');
      expect(weather.currentTemp, 15.0);
      expect(weather.maxTemp, 20.0);
      expect(weather.minTemp, 10.0);
      expect(weather.weatherDesc, 'Sunny');
      expect(weather.weatherCode, 113);
      expect(weather.humidity, 60);
      expect(weather.pressure, 1012);
      expect(weather.windSpeed, 10.0);
      expect(weather.visibility, 10.0);
      expect(weather.uvIndex, 5);
      expect(weather.date, DateFormat('d MMM, yyyy').format(DateTime.parse("2024-11-13")));
    });

    test('throws Exception if the city is not found', () async {
      final mockClient = MockClient((request) async {
        return http.Response('City not found', 404);
      });

      expect(() async => await getWeatherByCity('UnknownCity', client: mockClient),
             throwsException);
    });

    test('throws Exception for other errors', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Error getting the weather', 500);
      });

      expect(() async => await getWeatherByCity('AnyCity', client: mockClient),
             throwsException);
    });
  });
}
