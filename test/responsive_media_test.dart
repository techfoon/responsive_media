import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_media/responsive_media.dart'; // Replace with the correct path

void main() {
  group('ResponsiveMedia Test', () {
    late ResponsiveMedia rm;

    setUp(() {
      rm = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 400,
        orientation: Orientation.portrait,
        shortestSide: 400,
        longestSide: 800,
        scale: 1.0,
      );
    });

    test('Height and width calculations are accurate', () {
      expect(rm.fromHeight(0.5), 400);
      expect(rm.fromWidth(0.25), 100);
    });

    test('Size category returns correct labels', () {
      expect(rm.sizeCategory, 'S');

      final xs = ResponsiveMedia.testInstance(
        screenHeight: 800,
        screenWidth: 320,
        orientation: Orientation.portrait,
        shortestSide: 320,
        longestSide: 800,
      );
      expect(xs.sizeCategory, 'XS');

      final xl = ResponsiveMedia.testInstance(
        screenHeight: 1440,
        screenWidth: 1080,
        orientation: Orientation.portrait,
        shortestSide: 1080,
        longestSide: 1440,
      );
      expect(xl.sizeCategory, 'XL');
    });

    test('Dynamic size fetches value based on category', () {
      final value = rm.dynamicSize({
        'XS': 10,
        'S': 20,
        'M': 30,
        'L': 40,
        'XL': 50,
      });

      expect(value, 20);
    });

    test('Typography values are positive and scaled', () {
      expect(rm.h1, greaterThan(0));
      expect(rm.h2, lessThan(rm.h1));
      expect(rm.title, greaterThan(rm.h1));
      expect(rm.caption, lessThan(rm.body));
    });

    test('Spacing values are within expected range', () {
      expect(rm.spacingXS, closeTo(400 * 0.016, 0.01));
      expect(rm.spacingS, closeTo(400 * 0.025, 0.01));
    });

    test('Orientation properties are accurate', () {
      expect(rm.isPortrait, isTrue);
      expect(rm.isLandscape, isFalse);

      final landscapeInstance = ResponsiveMedia.testInstance(
        screenHeight: 400,
        screenWidth: 800,
        orientation: Orientation.landscape,
        shortestSide: 400,
        longestSide: 800,
      );

      expect(landscapeInstance.isPortrait, isFalse);
      expect(landscapeInstance.isLandscape, isTrue);
    });

    test('getResponsiveBox returns correct value based on orientation', () {
      double value = rm.getResponsiveBox(100, 200);
      expect(value, 100); // Portrait mode value

      final landscapeInstance = ResponsiveMedia.testInstance(
        screenHeight: 400,
        screenWidth: 800,
        orientation: Orientation.landscape,
        shortestSide: 400,
        longestSide: 800,
      );

      value = landscapeInstance.getResponsiveBox(100, 200);
      expect(value, 200); // Landscape mode value
    });
  });
}