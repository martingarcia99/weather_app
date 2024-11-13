import 'package:bondy_test/widgets/weather_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherError Widget Tests', () {
    testWidgets('WeatherError renders correctly', (WidgetTester tester) async {
      const testMessage = 'Error loading weather data';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherError(message: testMessage),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(
        find.image(const AssetImage('assets/images/error_weather.png')),
        findsOneWidget,
      );

      expect(find.text(testMessage), findsOneWidget);
    });

    testWidgets('WeatherError displays correct message', (WidgetTester tester) async {
      const errorMessage = 'Network error';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherError(message: errorMessage),
          ),
        ),
      );

      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('WeatherError has correct styling', (WidgetTester tester) async {
      const errorMessage = 'Sample error message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherError(message: errorMessage),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(4));

      final text = tester.widget<Text>(find.text(errorMessage));
      expect(text.style?.fontSize, 24);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('WeatherError Column alignment and image properties', (WidgetTester tester) async {
      const errorMessage = 'Error';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherError(message: errorMessage),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
      expect(column.mainAxisSize, MainAxisSize.min);

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, 200);
      expect(image.height, 200);
      expect(image.fit, BoxFit.contain);
    });
  });
}
