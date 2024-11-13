import 'package:bondy_test/models/functions/weather_icon_mapper.dart';
import 'package:bondy_test/utils/animations/slide_transition_animation.dart';
import 'package:bondy_test/widgets/city_input.dart';
import 'package:bondy_test/widgets/weather_default_card.dart';
import 'package:bondy_test/widgets/weather_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Weather App', 
          style: TextStyle(color: Colors.white),
        ), 
        backgroundColor: weatherProvider.weather != null 
          ? getBackgroundColor(weatherProvider.weather!.weatherCode) 
          : Colors.grey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CityInput(weather: weatherProvider),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: weatherProvider.weather != null
                  ? SlideTransitionAnimation(
                      key: ValueKey(weatherProvider.weather!.city),
                      duration: const Duration(milliseconds: 900),
                      begin: const Offset(0.4, 0),
                      end: Offset.zero,
                      curve: Curves.easeIn,
                      child: SingleChildScrollView(child: WeatherCard(weather: weatherProvider.weather!)),
                    )
                  : weatherProvider.errorMessage.isNotEmpty
                      ? WeatherError(message: weatherProvider.errorMessage)
                      : weatherProvider.isLoading
                          ? const CircularProgressIndicator(key: Key('loadingIndicator'))
                          : const WeatherDefaultCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}