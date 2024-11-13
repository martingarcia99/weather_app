import 'package:bondy_test/providers/weather_provider.dart';
import 'package:bondy_test/widgets/city_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FakeWeatherProvider extends WeatherProvider {
  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  Future<void> getWeather(String city) async {
    _isLoading = true;
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }
}

void main() {
  group('CityInput Widget Tests', () {
    late FakeWeatherProvider fakeWeatherProvider;

    setUp(() {
      fakeWeatherProvider = FakeWeatherProvider();
    });

    testWidgets('Should call getWeather when button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CityInput(weather: fakeWeatherProvider),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'New York');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(fakeWeatherProvider.isLoading, false);
    });

    testWidgets('Should show the CircularProgressIndicator when isLoading is true', (WidgetTester tester) async {
      fakeWeatherProvider.isLoading = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CityInput(weather: fakeWeatherProvider),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.search), findsNothing);
    });

    testWidgets('Should send text when search button on keyboard is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CityInput(weather: fakeWeatherProvider),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Los Angeles');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      expect(fakeWeatherProvider.isLoading, false);
    });
  });
}
