import 'package:bondy_test/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityInput extends StatelessWidget{

  final WeatherProvider weather;
  CityInput({required this.weather, super.key});

  final TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              suffixIconColor: Colors.grey,
              fillColor: const Color.fromARGB(255, 228, 228, 228),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              filled: true,
              hintText: "Select a city ...",
            ),
            onSubmitted: (value) {
              weather.getWeather(value);
            },
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 46,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 228, 228, 228),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.zero,
            ),
            onPressed: weather.isLoading ? null : () async { 
                weather.getWeather(controller.text);
                FocusScope.of(context).unfocus();
            },
            child: weather.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const FaIcon(
                    FontAwesomeIcons.search,
                    size: 30.0,
                    color: Colors.black,
                  ),
          ),
        ),
      ],
    );
  }
}