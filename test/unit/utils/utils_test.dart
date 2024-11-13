import 'package:bondy_test/utils/animations/slide_transition_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SlideTransitionAnimation animates from begin to end', (WidgetTester tester) async {
    const beginOffset = Offset(0.0, 1.0);
    const endOffset = Offset(0.0, 0.0); 
    const duration = Duration(seconds: 1);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SlideTransitionAnimation(
            duration: duration,
            begin: beginOffset,
            end: endOffset,
            child: Container(key: const Key('animatedContainer')),
          ),
        ),
      ),
    );

    SlideTransition slideTransition = tester.widget(find.byType(SlideTransition));
    expect(slideTransition.position.value, equals(beginOffset));

    await tester.pump(duration);

    slideTransition = tester.widget(find.byType(SlideTransition));
    expect(slideTransition.position.value, equals(endOffset));
  });
}
