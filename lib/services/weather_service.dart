import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

Future<Weather> getWeatherByCity(String city, {http.Client? client}) async {
  client ??= http.Client();
  final url = Uri.parse('https://wttr.in/$city?format=j1');
  final response = await client.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Weather.fromJson(data);
  } else {
    if(response.statusCode == 404) {
      throw Exception('City not found');
    }else{
      throw Exception('Error getting the weather');
    }
  }
}
