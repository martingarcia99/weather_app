import 'package:bondy_test/widgets/weather_default_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherDefaultCard Widget Tests', () {
    testWidgets('WeatherDefaultCard renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherDefaultCard(),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);

      final containerFinder = find.byType(Container);

      expect(containerFinder, findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(
        find.image(const AssetImage('assets/images/city.png')),
        findsOneWidget,
      );

      expect(find.text('Select a city to see the weather'), findsOneWidget);
    });

    testWidgets('WeatherDefaultCard has correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherDefaultCard(),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, equals(4));


      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, const EdgeInsets.all(20));

      expect(container.constraints?.maxWidth, double.infinity);

      final text = tester.widget<Text>(find.text('Select a city to see the weather'));
      expect(text.style?.fontSize, 18);
      expect(text.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('WeatherDefaultCard Column alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherDefaultCard(),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('WeatherDefaultCard image properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherDefaultCard(),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.width, 200);
      expect(image.height, 200);
      expect(image.fit, BoxFit.contain);
    });
  });
}
