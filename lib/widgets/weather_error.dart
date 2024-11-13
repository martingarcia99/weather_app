import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget{
  final String message;

  WeatherError({Key? key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Image(
                        image: AssetImage('assets/images/error_weather.png'), 
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain
                    ),
                    const SizedBox(height: 20),
                    Text(
                        message,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                ],
            ),
        )
    );
  }
}