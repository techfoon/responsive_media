import 'package:flutter/material.dart';

/// Import the Flutter material package for widgets and utilities

/// This class is responsible for adapting UI elements to different screen sizes and orientations.

class ResponsiveMedia {
  /// it is Main class

  final double screenHeight;

  /// screenHeight Holds the height of the screen in pixels

  /// Holds the width of the screen in pixels
  final double screenWidth;

  /// Stores the current orientation of the device (portrait or landscape)
  final Orientation orientation;

  /// The smallest side of the screen (width in portrait, height in landscape)
  final double shortestSide;

  /// The largest side of the screen (height in portrait, width in landscape)
  final double longestSide;

  /// A scaling factor to allow global custom scaling for all sizes
  final double scale;

  /// Private named constructor, only accessible within this class
  ResponsiveMedia._internal({
    required this.screenHeight,

    /// Assign the screen height
    required this.screenWidth,

    /// Assign the screen width
    required this.orientation,

    /// Assign the device orientation
    required this.shortestSide,

    /// Assign the shortest side of the screen
    required this.longestSide,

    /// Assign the longest side of the screen
    this.scale = 1,

    /// Default scale is 1 (no scaling applied)
  });

  /// Public factory constructor for testing purposes
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

  /// Static variable to hold the singleton instance of ResponsiveMedia
  static late ResponsiveMedia _instance;

  /// Initializes the ResponsiveMedia singleton. Must be called in the app's build method.
  static void init(
    BuildContext context,

    /// BuildContext provides access to the widget tree and MediaQuery
    {
    double? customHeight,

    /// Optional parameter to override screen height
    double? customWidth,

    /// Optional parameter to override screen width
    double scale = 1,

    /// Optional parameter to set scaling factor
  }) {
    final mediaQuery = MediaQuery.of(context);

    /// MediaQuery provides information about the screen
    final height = customHeight ?? mediaQuery.size.height;

    /// Use custom height or default to the screen height
    final width = customWidth ?? mediaQuery.size.width;

    /// Use custom width or default to the screen width
    final shortestSide = mediaQuery.size.shortestSide;

    /// Smallest side of the screen
    final longestSide = mediaQuery.size.longestSide;

    /// Largest side of the screen

    /// Create the singleton instance of ResponsiveMedia with calculated values
    _instance = ResponsiveMedia._internal(
      screenHeight: height,
      screenWidth: width,
      orientation: mediaQuery.orientation,
      shortestSide: shortestSide,
      longestSide: longestSide,
      scale: scale,
    );
  }

  /// Method to calculate height as a percentage of screen height
  double fromHeight(double factor) => screenHeight * factor * scale;

  /// Method to calculate width as a percentage of screen width
  double fromWidth(double factor) => screenWidth * factor * scale;

  /// Getter to retrieve the singleton instance of ResponsiveMedia
  static ResponsiveMedia get instance => _instance;

  /// Determines the size category based on the screen width, useful for responsive design breakpoints
  String get sizeCategory {
    if (screenWidth < 360) {
      return 'XS';

      /// Extra-small devices
    } else if (screenWidth < 480) {
      return 'S';

      /// Small devices
    } else if (screenWidth < 768) {
      return 'M';

      /// Medium devices (e.g., small tablets)
    } else if (screenWidth < 1024) {
      return 'L';

      /// Large devices (e.g., tablets)
    } else {
      return 'XL';

      /// Extra-large devices (e.g., desktops or large tablets)
    }
  }

  /// Returns a dynamic size based on the current size category
  /// `sizes` is a map where keys are size categories ('XS', 'S', etc.) and values are their corresponding sizes
  double dynamicSize(Map<String, double> sizes) {
    return sizes[sizeCategory]! * scale;

    /// Multiply the size for the current category by the scale factor
  }

  /// Dynamically calculated typography sizes for headings and other text elements
  /// These sizes are scaled based on the 'shortestSide' and breakpoints
  double get h1 => dynamicSize({
        'XS': shortestSide * 0.045,
        'S': shortestSide * 0.05,
        'M': shortestSide * 0.055,
        'L': shortestSide * 0.06,
        'XL': shortestSide * 0.065
      });

  /// responsive h2 it will dynamicly ajust the size
  double get h2 => dynamicSize({
        'XS': shortestSide * 0.038,
        'S': shortestSide * 0.043,
        'M': shortestSide * 0.048,
        'L': shortestSide * 0.053,
        'XL': shortestSide * 0.058
      });

  /// responsive h3 it will dynamicly ajust the size
  double get h3 => dynamicSize({
        'XS': shortestSide * 0.032,
        'S': shortestSide * 0.037,
        'M': shortestSide * 0.042,
        'L': shortestSide * 0.047,
        'XL': shortestSide * 0.052
      });

  /// responsive h4 it will dynamicly ajust the size
  double get h4 => dynamicSize({
        'XS': shortestSide * 0.026,
        'S': shortestSide * 0.031,
        'M': shortestSide * 0.036,
        'L': shortestSide * 0.041,
        'XL': shortestSide * 0.046
      });

  /// responsive h5 it will dynamicly ajust the size
  double get h5 => dynamicSize({
        'XS': shortestSide * 0.022,
        'S': shortestSide * 0.027,
        'M': shortestSide * 0.032,
        'L': shortestSide * 0.037,
        'XL': shortestSide * 0.042
      });

  /// responsive h6 it will dynamicly ajust the size
  double get h6 => dynamicSize({
        'XS': shortestSide * 0.02,
        'S': shortestSide * 0.025,
        'M': shortestSide * 0.03,
        'L': shortestSide * 0.035,
        'XL': shortestSide * 0.04
      });

  /// responsive title it will dynamicly ajust the size
  /// Responsive title, dynamically adjusts the size
  double get title => dynamicSize({
        'XS': shortestSide * 0.052, // 26px
        'S': shortestSide * 0.056, // 28px
        'M': shortestSide * 0.06, // 30px
        'L': shortestSide * 0.064, // 32px
        'XL': shortestSide * 0.072, // 36px
      });

  /// Responsive subtitle, dynamically adjusts the size
  double get subtitle => dynamicSize({
        'XS': shortestSide * 0.044, // 22px
        'S': shortestSide * 0.048, // 24px
        'M': shortestSide * 0.052, // 26px
        'L': shortestSide * 0.056, // 28px
        'XL': shortestSide * 0.064, // 32px
      });

  /// Responsive body text, dynamically adjusts the size
  double get body => dynamicSize({
        'XS': shortestSide * 0.036, // 18px
        'S': shortestSide * 0.04, // 20px
        'M': shortestSide * 0.044, // 22px
        'L': shortestSide * 0.048, // 24px
        'XL': shortestSide * 0.052, // 26px
      });

  /// Responsive caption text, dynamically adjusts the size
  double get caption => dynamicSize({
        'XS': shortestSide * 0.032, // 16px
        'S': shortestSide * 0.036, // 18px
        'M': shortestSide * 0.04, // 20px
        'L': shortestSide * 0.044, // 22px
        'XL': shortestSide * 0.048, // 24px
      });

  /// Responsive button text, dynamically adjusts the size
  double get buttonText => dynamicSize({
        'XS': shortestSide * 0.028, // 14px
        'S': shortestSide * 0.032, // 16px
        'M': shortestSide * 0.036, // 18px
        'L': shortestSide * 0.04, // 20px
        'XL': shortestSide * 0.044, // 22px
      });

  /// Responsive overline text, dynamically adjusts the size
  double get overline => dynamicSize({
        'XS': shortestSide * 0.028, // 14px
        'S': shortestSide * 0.032, // 16px
        'M': shortestSide * 0.036, // 18px
        'L': shortestSide * 0.04, // 20px
        'XL': shortestSide * 0.044, // 22px
      });

  /// spacing to for gaps
  /// Dynamic spacing for gaps
  double get spacingXS => dynamicSize({
        'XS': shortestSide * 0.01, // Very small spacing for extra-small devices
        'S': shortestSide * 0.012, // Slightly larger for small devices
        'M': shortestSide * 0.014, // Medium spacing for medium devices
        'L': shortestSide * 0.016, // Larger spacing for large devices
        'XL': shortestSide * 0.018, // Largest spacing for extra-large devices
      });

  /// Small devices get slightly more spacing
  double get spacingS => dynamicSize({
        'XS': shortestSide * 0.02,
        'S': shortestSide * 0.025,
        'M': shortestSide * 0.03,
        'L': shortestSide * 0.035,
        'XL': shortestSide * 0.04, // Scales properly for large devices
      });

  ///  Mediam spacing
  double get spacingM => dynamicSize({
        'XS': shortestSide * 0.03,
        'S': shortestSide * 0.035,
        'M': shortestSide * 0.04,
        'L': shortestSide * 0.045,
        'XL': shortestSide * 0.05, // Comfortable spacing for most layouts
      });

  ///  Large spacing
  double get spacingL => dynamicSize({
        'XS': shortestSide * 0.04,
        'S': shortestSide * 0.05,
        'M': shortestSide * 0.06,
        'L': shortestSide * 0.07,
        'XL': shortestSide * 0.08, // Appropriate for larger gaps
      });

  /// extra spacing
  double get spacingXL => dynamicSize({
        'XS': shortestSide * 0.05,
        'S': shortestSide * 0.06,
        'M': shortestSide * 0.07,
        'L': shortestSide * 0.08,
        'XL': shortestSide * 0.1, // Largest spacing for extra-large devices
      });

  /// In landscape mode, use the screen width for scaling.
  double responsiveValue(double value) {
    return isLandscape
        ? (screenWidth * (value / 100)) // Use screen width in landscape
        : (shortestSide * (value / 100)); // Use shortest side in portrait
  }

  /// Responsive padding for all sides
  EdgeInsets paddingAll(double value) {
    double padding = responsiveValue(value);
    return EdgeInsets.all(padding);
  }

  /// Responsive padding for vertical sides (top and bottom)
  EdgeInsets paddingVertical(double value) {
    double padding = responsiveValue(value);
    return EdgeInsets.symmetric(vertical: padding);
  }

  /// Responsive padding for horizontal sides (left and right)
  EdgeInsets paddingHorizontal(double value) {
    double padding = responsiveValue(value);
    return EdgeInsets.symmetric(horizontal: padding);
  }

  /// Responsive margin for all sides
  EdgeInsets marginAll(double value) {
    double margin = responsiveValue(value);
    return EdgeInsets.all(margin);
  }

  /// Responsive margin for vertical sides (top and bottom)
  EdgeInsets marginVertical(double value) {
    double margin = responsiveValue(value);
    return EdgeInsets.symmetric(vertical: margin);
  }

  /// Responsive margin for horizontal sides (left and right)
  EdgeInsets marginHorizontal(double value) {
    double margin = responsiveValue(value);
    return EdgeInsets.symmetric(horizontal: margin);
  }

  /// Function to create a gap widget
  /// - `customWidget`: A custom widget to use as a gap. If provided, it overrides the default gap behavior.
  /// - `size`: The size of the gap, calculated based on predefined spacing and scaling.
  /// - `isHorizontal`: Determines if the gap is horizontal. Defaults to `false` (vertical).
  /// Returns a `SizedBox` with either its height (for vertical gaps) or width (for horizontal gaps) set.
  Widget gap({
    Widget? customWidget,
    double? size,
    bool isHorizontal = false, // Default is vertical
  }) {
    if (customWidget != null) {
      return customWidget; // Use the custom widget if provided
    }
    return SizedBox(
      height:
          isHorizontal ? null : size ?? spacingM, // Set height for vertical gap
      width: isHorizontal
          ? size ?? spacingM
          : null, // Set width for horizontal gap
    );
  }

  /// Predefined gaps for convenience, now supporting both vertical and horizontal orientations and scaling.
  /// Default is vertical, but can be switched to horizontal using `isHorizontal: true`.

  /// Extra-small gap (spacingXS)
  Widget gapXS({bool isHorizontal = false, double scale = 1.0}) =>
      gap(size: spacingXS * scale, isHorizontal: isHorizontal);

  /// Small gap (spacingS)
  Widget gapS({bool isHorizontal = false, double scale = 1.0}) =>
      gap(size: spacingS * scale, isHorizontal: isHorizontal);

  /// Medium gap (spacingM)
  Widget gapM({bool isHorizontal = false, double scale = 1.0}) =>
      gap(size: spacingM * scale, isHorizontal: isHorizontal);

  /// Large gap (spacingL)
  Widget gapL({bool isHorizontal = false, double scale = 1.0}) =>
      gap(size: spacingL * scale, isHorizontal: isHorizontal);

  /// Extra-large gap (spacingXL)
  Widget gapXL({bool isHorizontal = false, double scale = 1.0}) =>
      gap(size: spacingXL * scale, isHorizontal: isHorizontal);

  /// Determines if the screen is in portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// Determines if the screen is in landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// - `portraitValue`: The value to use for portrait orientation.
  /// - `landscapeValue`: The value to use for landscape orientation.
  double getResponsiveBox(double portraitValue, double landscapeValue) {
    /// Returns a responsive size based on the current orientation
    return isPortrait ? portraitValue : landscapeValue;
  }

  /// Provides a string representation of the instance for debugging

  @override
  String toString() {
    return 'ResponsiveMedia(h1: ${h1.toStringAsFixed(2)}, subtitle: ${subtitle.toStringAsFixed(2)}, scale: $scale)';
  }
}
