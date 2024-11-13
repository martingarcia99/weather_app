import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> getWeather(String input) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _weather = await getWeatherByCity(input);
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        _errorMessage = errorMessage.replaceFirst('Exception: ', '');
      }
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
