import 'package:flutter/material.dart';

class WeatherDefaultCard extends StatelessWidget {

  const WeatherDefaultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/images/city.png'), 
                width: 200,
                height: 200,
                fit: BoxFit.contain
            ),
            SizedBox(height: 20),
            Text(
                'Select a city to see the weather',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    );
  }
}
