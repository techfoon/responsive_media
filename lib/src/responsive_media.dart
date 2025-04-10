
import 'package:flutter/material.dart';

class ResponsiveMedia {
  final double screenHeight;
  final double screenWidth;
  final Orientation orientation;
  final double shortestSide;
  final double scale;

  ResponsiveMedia._internal({
    required this.screenHeight,
    required this.screenWidth,
    required this.orientation,
    required this.shortestSide,
    this.scale = 1,
  });

  static late ResponsiveMedia _instance;

  static void init(
    BuildContext context, {
    double? customHeight,
    double? customWidth,
    double scale = 1,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final height = customHeight ?? mediaQuery.size.height;
    final width = customWidth ?? mediaQuery.size.width;
    final shortestSide = mediaQuery.size.shortestSide;

    _instance = ResponsiveMedia._internal(
      screenHeight: height,
      screenWidth: width,
      orientation: mediaQuery.orientation,
      shortestSide: shortestSide,
      scale: scale,
    );
  }

  static ResponsiveMedia get instance => _instance;

  double get h1 => shortestSide * 0.045 * scale;
  double get h2 => shortestSide * 0.038 * scale;
  double get h3 => shortestSide * 0.032 * scale;
  double get h4 => shortestSide * 0.026 * scale;
  double get h5 => shortestSide * 0.022 * scale;
  double get h6 => shortestSide * 0.02 * scale;
  double get title => shortestSide * 0.024 * scale;
  double get subtitle => shortestSide * 0.02 * scale;
  double get p => shortestSide * 0.018 * scale;

  double get small => screenWidth * 0.035 * scale;
  double get medium => screenWidth * 0.055 * scale;
  double get large => screenWidth * 0.075 * scale;

  double fromHeight(double factor) => screenHeight * factor * scale;
  double fromWidth(double factor) => screenWidth * factor * scale;
  double get customSize => shortestSide * scale;

  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isTablet => shortestSide > 600;

  TextStyle get h1Style => TextStyle(fontSize: h1, fontWeight: FontWeight.bold);
  TextStyle get h2Style => TextStyle(fontSize: h2, fontWeight: FontWeight.bold);
  TextStyle get h3Style => TextStyle(fontSize: h3);
  TextStyle get h4Style => TextStyle(fontSize: h4);
  TextStyle get h5Style => TextStyle(fontSize: h5);
  TextStyle get h6Style => TextStyle(fontSize: h6);
  TextStyle get titleStyle => TextStyle(fontSize: title);
  TextStyle get subtitleStyle => TextStyle(fontSize: subtitle);
  TextStyle get pStyle => TextStyle(fontSize: p);

  Widget h1Text(String data, {Color? color, FontWeight? weight}) => Text(
        data,
        style: TextStyle(
          fontSize: h1,
          fontWeight: weight ?? FontWeight.bold,
          color: color,
        ),
      );

  EdgeInsets get defaultPadding => EdgeInsets.all(shortestSide * 0.025);
  EdgeInsets get verticalPadding =>
      EdgeInsets.symmetric(vertical: shortestSide * 0.025);
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: screenWidth * 0.045);

  double get spacingXS => shortestSide * 0.007;
  double get spacingS => shortestSide * 0.012;
  double get spacingM => shortestSide * 0.025;
  double get spacingL => shortestSide * 0.045;
  double get spacingXL => shortestSide * 0.07;

  EdgeInsets get marginXS => EdgeInsets.all(spacingXS);
  EdgeInsets get marginS => EdgeInsets.all(spacingS);
  EdgeInsets get marginM => EdgeInsets.all(spacingM);
  EdgeInsets get marginL => EdgeInsets.all(spacingL);
  EdgeInsets get marginXL => EdgeInsets.all(spacingXL);

  Widget gapXS() => SizedBox(height: spacingXS);
  Widget gapS() => SizedBox(height: spacingS);
  Widget gapM() => SizedBox(height: spacingM);
  Widget gapL() => SizedBox(height: spacingL);
  Widget gapXL() => SizedBox(height: spacingXL);

  @override
  String toString() {
    return 'ResponsiveMedia(h1: \${h1.toStringAsFixed(2)}, p: \${p.toStringAsFixed(2)}, scale: \$scale)';
  }
}
