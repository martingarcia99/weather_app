import 'package:bondy_test/models/weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Weather.fromJson', () {
    test('Must successfully parse valid JSON', () {
      final json = {
        "nearest_area": [
          {
            "areaName": [
              {"value": "Test City"}
            ]
          }
        ],
        "current_condition": [
          {
            "temp_C": "22.5",
            "weatherDesc": [
              {"value": "Clear"}
            ],
            "weatherCode": "113",
            "humidity": "65",
            "pressure": "1012",
            "windspeedKmph": "15.0",
            "visibility": "10.0",
            "uvIndex": "5"
          }
        ],
        "weather": [
          {
            "maxtempC": "25.0",
            "mintempC": "15.0",
            "date": "2023-11-01"
          }
        ]
      };

      final weather = Weather.fromJson(json);

      expect(weather.city, 'Test City');
      expect(weather.currentTemp, 22.5);
      expect(weather.maxTemp, 25.0);
      expect(weather.minTemp, 15.0);
      expect(weather.weatherDesc, 'Clear');
      expect(weather.weatherCode, 113);
      expect(weather.humidity, 65);
      expect(weather.pressure, 1012);
      expect(weather.windSpeed, 15.0);
      expect(weather.visibility, 10.0);
      expect(weather.uvIndex, 5);
      expect(weather.date, DateFormat('d MMM, yyyy').format(DateTime.parse("2023-11-01")));
    });

    test('Should throw an exception if the JSON has invalid data', () {
      final invalidJson = {
        "nearest_area": [
          {
            "areaName": [
              {"value": "Test City"}
            ]
          }
        ],
        "current_condition": [
          {
            "temp_C": "invalid_temp",
            "weatherDesc": [
              {"value": "Clear"}
            ],
            "weatherCode": "113",
            "humidity": "65",
            "pressure": "invalid_pressure",
            "windspeedKmph": "15.0",
            "visibility": "10.0",
            "uvIndex": "5"
          }
        ],
        "weather": [
          {
            "maxtempC": "25.0",
            "mintempC": "15.0",
            "date": "2023-11-01"
          }
        ]
      };

      expect(() => Weather.fromJson(invalidJson), throwsA(isA<FormatException>()));
    });
  });
}
