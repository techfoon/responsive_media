import 'package:flutter/material.dart'; // Import the Flutter material package for widgets and utilities

// This class is responsible for adapting UI elements to different screen sizes and orientations.

class ResponsiveMedia {
  // Holds the height of the screen in pixels
  final double screenHeight;

  // Holds the width of the screen in pixels
  final double screenWidth;

  // Stores the current orientation of the device (portrait or landscape)
  final Orientation orientation;

  // The smallest side of the screen (width in portrait, height in landscape)
  final double shortestSide;

  // The largest side of the screen (height in portrait, width in landscape)
  final double longestSide;

  // A scaling factor to allow global custom scaling for all sizes
  final double scale;

  // Private named constructor, only accessible within this class
  ResponsiveMedia._internal({
    required this.screenHeight, // Assign the screen height
    required this.screenWidth, // Assign the screen width
    required this.orientation, // Assign the device orientation
    required this.shortestSide, // Assign the shortest side of the screen
    required this.longestSide, // Assign the longest side of the screen
    this.scale = 1, // Default scale is 1 (no scaling applied)
  });

  // Public factory constructor for testing purposes
  factory ResponsiveMedia.testInstance({
    required double screenHeight,
    required double screenWidth,
    required Orientation orientation,
    required double shortestSide,
    required double longestSide,
    double scale = 1,
  }) {
    return ResponsiveMedia._internal(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      orientation: orientation,
      shortestSide: shortestSide,
      longestSide: longestSide,
      scale: scale,
    );
  }
  // Static variable to hold the singleton instance of ResponsiveMedia
  static late ResponsiveMedia _instance;

  // Initializes the ResponsiveMedia singleton. Must be called in the app's build method.
  static void init(
    BuildContext
        context, // BuildContext provides access to the widget tree and MediaQuery
    {
    double? customHeight, // Optional parameter to override screen height
    double? customWidth, // Optional parameter to override screen width
    double scale = 1, // Optional parameter to set scaling factor
  }) {
    final mediaQuery = MediaQuery.of(
        context); // MediaQuery provides information about the screen
    final height = customHeight ??
        mediaQuery
            .size.height; // Use custom height or default to the screen height
    final width = customWidth ??
        mediaQuery
            .size.width; // Use custom width or default to the screen width
    final shortestSide =
        mediaQuery.size.shortestSide; // Smallest side of the screen
    final longestSide =
        mediaQuery.size.longestSide; // Largest side of the screen

    // Create the singleton instance of ResponsiveMedia with calculated values
    _instance = ResponsiveMedia._internal(
      screenHeight: height,
      screenWidth: width,
      orientation: mediaQuery.orientation,
      shortestSide: shortestSide,
      longestSide: longestSide,
      scale: scale,
    );
  }

  // Method to calculate height as a percentage of screen height
  double fromHeight(double factor) => screenHeight * factor * scale;

  // Method to calculate width as a percentage of screen width
  double fromWidth(double factor) => screenWidth * factor * scale;

  // Getter to retrieve the singleton instance of ResponsiveMedia
  static ResponsiveMedia get instance => _instance;

  // Determines the size category based on the screen width, useful for responsive design breakpoints
  String get sizeCategory {
    if (screenWidth < 360) {
      return 'XS'; // Extra-small devices
    } else if (screenWidth < 480) {
      return 'S'; // Small devices
    } else if (screenWidth < 768) {
      return 'M'; // Medium devices (e.g., small tablets)
    } else if (screenWidth < 1024) {
      return 'L'; // Large devices (e.g., tablets)
    } else {
      return 'XL'; // Extra-large devices (e.g., desktops or large tablets)
    }
  }

  // Returns a dynamic size based on the current size category
  // `sizes` is a map where keys are size categories ('XS', 'S', etc.) and values are their corresponding sizes
  double dynamicSize(Map<String, double> sizes) {
    return sizes[sizeCategory]! *
        scale; // Multiply the size for the current category by the scale factor
  }

  // Dynamically calculated typography sizes for headings and other text elements
  // These sizes are scaled based on the 'shortestSide' and breakpoints
  double get h1 => dynamicSize({
        'XS': shortestSide * 0.045,
        'S': shortestSide * 0.05,
        'M': shortestSide * 0.055,
        'L': shortestSide * 0.06,
        'XL': shortestSide * 0.065
      });
  double get h2 => dynamicSize({
        'XS': shortestSide * 0.038,
        'S': shortestSide * 0.043,
        'M': shortestSide * 0.048,
        'L': shortestSide * 0.053,
        'XL': shortestSide * 0.058
      });
  double get h3 => dynamicSize({
        'XS': shortestSide * 0.032,
        'S': shortestSide * 0.037,
        'M': shortestSide * 0.042,
        'L': shortestSide * 0.047,
        'XL': shortestSide * 0.052
      });
  double get h4 => dynamicSize({
        'XS': shortestSide * 0.026,
        'S': shortestSide * 0.031,
        'M': shortestSide * 0.036,
        'L': shortestSide * 0.041,
        'XL': shortestSide * 0.046
      });
  double get h5 => dynamicSize({
        'XS': shortestSide * 0.022,
        'S': shortestSide * 0.027,
        'M': shortestSide * 0.032,
        'L': shortestSide * 0.037,
        'XL': shortestSide * 0.042
      });
  double get h6 => dynamicSize({
        'XS': shortestSide * 0.02,
        'S': shortestSide * 0.025,
        'M': shortestSide * 0.03,
        'L': shortestSide * 0.035,
        'XL': shortestSide * 0.04
      });
  double get title => dynamicSize({
        'XS': shortestSide * 0.035,
        'S': shortestSide * 0.04,
        'M': shortestSide * 0.045,
        'L': shortestSide * 0.05,
        'XL': shortestSide * 0.055
      });
  double get subtitle => dynamicSize({
        'XS': shortestSide * 0.03,
        'S': shortestSide * 0.035,
        'M': shortestSide * 0.04,
        'L': shortestSide * 0.045,
        'XL': shortestSide * 0.05
      });
  double get body => dynamicSize({
        'XS': shortestSide * 0.025,
        'S': shortestSide * 0.03,
        'M': shortestSide * 0.035,
        'L': shortestSide * 0.04,
        'XL': shortestSide * 0.045
      });
  double get caption => dynamicSize({
        'XS': shortestSide * 0.02,
        'S': shortestSide * 0.025,
        'M': shortestSide * 0.03,
        'L': shortestSide * 0.035,
        'XL': shortestSide * 0.04
      });
  double get button => dynamicSize({
        'XS': shortestSide * 0.022,
        'S': shortestSide * 0.027,
        'M': shortestSide * 0.032,
        'L': shortestSide * 0.037,
        'XL': shortestSide * 0.042
      });
  double get overline => dynamicSize({
        'XS': shortestSide * 0.018,
        'S': shortestSide * 0.023,
        'M': shortestSide * 0.028,
        'L': shortestSide * 0.033,
        'XL': shortestSide * 0.038
      });

  // TextStyle getters for different text elements, using the dynamically calculated sizes
  TextStyle get h1Style => TextStyle(fontSize: h1, fontWeight: FontWeight.bold);
  TextStyle get h2Style => TextStyle(fontSize: h2, fontWeight: FontWeight.bold);
  TextStyle get h3Style => TextStyle(fontSize: h3);
  TextStyle get h4Style => TextStyle(fontSize: h4);
  TextStyle get h5Style => TextStyle(fontSize: h5);
  TextStyle get h6Style => TextStyle(fontSize: h6);
  TextStyle get titleStyle => TextStyle(fontSize: title);
  TextStyle get subtitleStyle => TextStyle(fontSize: subtitle);
  TextStyle get bodyStyle => TextStyle(fontSize: body);
  TextStyle get captionStyle => TextStyle(fontSize: caption);
  TextStyle get buttonStyle => TextStyle(fontSize: button);
  TextStyle get overlineStyle => TextStyle(fontSize: overline);

  // Spacing values for consistent spacing between UI elements
  double get spacingXS => shortestSide * 0.007;
  double get spacingS => shortestSide * 0.012;
  double get spacingM => shortestSide * 0.025;
  double get spacingL => shortestSide * 0.045;
  double get spacingXL => shortestSide * 0.07;

  // Default padding for widgets
  EdgeInsets get defaultPadding => EdgeInsets.all(shortestSide * 0.025);

  // Vertical padding for widgets
  EdgeInsets get verticalPadding =>
      EdgeInsets.symmetric(vertical: shortestSide * 0.025);

  // Horizontal padding for widgets
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: screenWidth * 0.045);

  // Margin values for consistent layout spacing
  EdgeInsets get marginXS => EdgeInsets.all(spacingXS);
  EdgeInsets get marginS => EdgeInsets.all(spacingS);
  EdgeInsets get marginM => EdgeInsets.all(spacingM);
  EdgeInsets get marginL => EdgeInsets.all(spacingL);
  EdgeInsets get marginXL => EdgeInsets.all(spacingXL);

  // Creates a gap (spacer) widget, either a custom widget or a SizedBox
  Widget gap({Widget? customWidget, double? height, double? width}) {
    if (customWidget != null) {
      return  customWidget; // Use a custom widget if provided
    }
    return SizedBox(
        height: height ?? spacingM,
        width: width ?? spacingM); // Default to a SizedBox spacer
  }

  // Predefined gaps for convenience
  Widget gapXS() => gap(height: spacingXS);
  Widget gapS() => gap(height: spacingS);
  Widget gapM() => gap(height: spacingM);
  Widget gapL() => gap(height: spacingL);
  Widget gapXL() => gap(height: spacingXL);

  // Provides a string representation of the instance for debugging
  @override
  String toString() {
    return 'ResponsiveMedia(h1: ${h1.toStringAsFixed(2)}, subtitle: ${subtitle.toStringAsFixed(2)}, scale: $scale)';
  }
}
