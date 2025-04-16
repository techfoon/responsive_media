import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_media/responsive_media.dart';

void main() {
  group('ResponsiveMedia', () {
    test('ResponsiveMedia initializes correctly', () {
      // Create a test instance of ResponsiveMedia using the public `testInstance` factory constructor
      final media = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );

      // Verify that all properties are set correctly
      expect(media.screenHeight, 800);
      expect(media.screenWidth, 400);
      expect(media.shortestSide, 400);
      expect(media.longestSide, 800);
      expect(media.scale, 1.0);
    });

    test('Dynamic size calculation works correctly', () {
      // Create a test instance of ResponsiveMedia
      final media = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );

      // Test dynamic size with a predefined mapping
      final size = media.dynamicSize({
        'XS': 10,
        'S': 12,
        'M': 14,
        'L': 16,
        'XL': 18,
      });

      // Debug print to confirm the size category and dynamic size
      print('Dynamic Size: $size, Size Category: ${media.sizeCategory}');

      // Verify that the size is calculated correctly for the "S" size category
      expect(size, 12);
    });

    test('Predefined text styles are calculated correctly', () {
      // Create a test instance of ResponsiveMedia
      final media = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );

      // Test that h1 size is calculated correctly
      final h1Size = media.h1;
      print('h1 Size: $h1Size, Shortest Side: ${media.shortestSide}');

      // Verify that the h1 size is calculated correctly for the "S" size category
      final expectedH1Size = 400 * 0.05; // shortestSide * 0.05 for "S"
      expect(h1Size, closeTo(expectedH1Size, 0.1));
    });

    test('Padding and spacing values are calculated correctly', () {
      // Create a test instance of ResponsiveMedia
      final media = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );

      // Verify padding and spacing values
      expect(media.defaultPadding, EdgeInsets.all(10.0));
      expect(media.spacingS, closeTo(4.8, 0.1));
      expect(media.spacingXL, closeTo(28, 0.1));
    });

    test('Gap widgets are created correctly', () {
      // Create a test instance of ResponsiveMedia
      final media = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );

      // Test a predefined gap widget
      final smallGap = media.gapS();
      expect(smallGap, isA<SizedBox>());

      // Test a custom gap widget
      final customGap = media.gap(height: 20.0, width: 10.0);
      expect(customGap, isA<SizedBox>());
      expect((customGap as SizedBox).height, 20.0);
      expect(customGap.width, 10.0);
    });
  });
}
