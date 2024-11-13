import 'package:intl/intl.dart';

class Weather {
  final String city;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherDesc;
  final int weatherCode;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final double visibility;
  final int uvIndex;
  final String date;

  Weather({
    required this.city,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherDesc,
    required this.weatherCode,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.visibility,
    required this.uvIndex,
    required this.date,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['nearest_area'][0]['areaName'][0]['value'],
      currentTemp: double.parse(json['current_condition'][0]['temp_C']),
      maxTemp: double.parse(json['weather'][0]['maxtempC']),
      minTemp: double.parse(json['weather'][0]['mintempC']),
      weatherDesc: json['current_condition'][0]['weatherDesc'][0]['value'],
      weatherCode: int.parse(json['current_condition'][0]['weatherCode']),
      humidity: int.parse(json['current_condition'][0]['humidity']),
      pressure: int.parse(json['current_condition'][0]['pressure']),
      windSpeed: double.parse(json['current_condition'][0]['windspeedKmph']),
      visibility: double.parse(json['current_condition'][0]['visibility']),
      uvIndex: int.parse(json['current_condition'][0]['uvIndex']),
      date: DateFormat('d MMM, yyyy').format(DateTime.parse(json['weather'][0]['date']))
    );
  }
}