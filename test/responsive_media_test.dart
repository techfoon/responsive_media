import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_media/responsive_media.dart';

void main() {
  testWidgets('ResponsiveMedia calculates h1 size', (WidgetTester tester) async {
    const testKey = Key('test');

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            ResponsiveMedia.init(context); // initialize first
            final rm = ResponsiveMedia.instance; // then access instance

            return Container(
              key: testKey,
              child: Text('H1', style: TextStyle(fontSize: rm.h1)),
            );
          },
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('H1'));
    expect(textWidget.style?.fontSize, isNonZero);
  });
}
