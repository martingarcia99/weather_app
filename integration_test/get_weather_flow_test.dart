import 'package:bondy_test/widgets/weather_card.dart';
import 'package:bondy_test/widgets/weather_default_card.dart';
import 'package:bondy_test/widgets/weather_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bondy_test/providers/weather_provider.dart';
import 'package:bondy_test/screens/weather_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('WeatherScreen E2E Test', () {
    testWidgets('Load, success and error in weather search', (WidgetTester tester) async {
      final weatherProvider = WeatherProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<WeatherProvider>.value(
          value: weatherProvider,
          child: const MaterialApp(
            home: WeatherScreen(),
          ),
        ),
      );

      expect(find.byType(WeatherDefaultCard), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Madrid');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.runAsync(() async {
        weatherProvider.getWeather('Madrid');
      });
      await tester.pump();

      expect(find.byKey(const Key('loadingIndicator')), findsOneWidget);

      await tester.runAsync(() async {
        await weatherProvider.getWeather('Madrid');
      });
      await tester.pumpAndSettle();

      expect(find.byType(WeatherCard), findsOneWidget);
      expect(find.text('Madrid'), findsOneWidget);

      await tester.runAsync(() async {
        await weatherProvider.getWeather('Unknown City');
      });
      await tester.pumpAndSettle();

      expect(find.byType(WeatherError), findsOneWidget);
      expect(find.text('City not found'), findsOneWidget);
    });
  });
}
