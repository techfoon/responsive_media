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
  double get title => dynamicSize({
        'XS': shortestSide * 0.051,

        /// was 0.035
        'S': shortestSide * 0.058,

        /// was 0.04
        'M': shortestSide * 0.065,

        /// was 0.045
        'L': shortestSide * 0.072,

        /// was 0.05
        'XL': shortestSide * 0.079,

        /// was 0.055
      });

  /// responsive subtitle it will dynamicly ajust the size
  double get subtitle => dynamicSize({
        'XS': shortestSide * 0.043,

        /// was 0.03
        'S': shortestSide * 0.051,

        /// was 0.035
        'M': shortestSide * 0.058,

        /// was 0.04
        'L': shortestSide * 0.065,

        /// was 0.045
        'XL': shortestSide * 0.072,

        /// was 0.05
      });

  /// responsive body it will dynamicly ajust the size
  double get body => dynamicSize({
        'XS': shortestSide * 0.036,

        /// was 0.025
        'S': shortestSide * 0.043,

        /// was 0.03
        'M': shortestSide * 0.050,

        /// was 0.035
        'L': shortestSide * 0.058,

        /// was 0.04
        'XL': shortestSide * 0.065,

        /// was 0.045
      });

  /// responsive caption it will dynamicly ajust the size
  double get caption => dynamicSize({
        'XS': shortestSide * 0.029,

        /// was 0.02
        'S': shortestSide * 0.036,

        /// was 0.025
        'M': shortestSide * 0.043,

        /// was 0.03
        'L': shortestSide * 0.050,

        /// was 0.035
        'XL': shortestSide * 0.058,

        /// was 0.04
      });

  /// responsive bottonText it will dynamicly ajust the size. used for button text "click here"
  double get buttonText => dynamicSize({
        'XS': shortestSide * 0.022,

        /// was 0.022
        'S': shortestSide * 0.027,

        /// was 0.027
        'M': shortestSide * 0.032,

        /// was 0.032
        'L': shortestSide * 0.037,

        /// was 0.037
        'XL': shortestSide * 0.042,

        /// was 0.042
      });

  /// responsive overline it will dynamicly ajust the size
  double get overline => dynamicSize({
        'XS': shortestSide * 0.026,

        /// was 0.018
        'S': shortestSide * 0.033,

        /// was 0.023
        'M': shortestSide * 0.040,

        /// was 0.028
        'L': shortestSide * 0.048,

        /// was 0.033
        'XL': shortestSide * 0.055,

        /// was 0.038
      });

  /// spacing to for gaps
  double get spacingXS => shortestSide * 0.016;

  /// Previous: shortestSide * 0.012 (~4.5px) → Slightly increased
  double get spacingS => shortestSide * 0.025;

  /// Previous: shortestSide * 0.025 (~9.4px) → Slightly increased
  double get spacingM => shortestSide * 0.04;

  /// Previous: shortestSide * 0.045 (~16.9px) → Increased for better spacing
  double get spacingL => shortestSide * 0.06;

  /// Previous: shortestSide * 0.07 (~26.25px) → Slightly increased
  double get spacingXL => shortestSide * 0.085;

  /// Default padding for widgets
  EdgeInsets get defaultPadding => EdgeInsets.all(shortestSide * 0.025);

  /// Vertical padding for widgets
  EdgeInsets get verticalPadding =>
      EdgeInsets.symmetric(vertical: shortestSide * 0.025);

  /// Horizontal padding for widgets
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: screenWidth * 0.045);

  /// Margin values for consistent layout spacing
  EdgeInsets get marginXS => EdgeInsets.all(spacingXS);

  /// Small Margin values for consistent layout spacing

  EdgeInsets get marginS => EdgeInsets.all(spacingS);

  ///Mediam large Margin values for consistent layout spacing
  EdgeInsets get marginM => EdgeInsets.all(spacingM);

  /// large Margin values for consistent layout spacing
  EdgeInsets get marginL => EdgeInsets.all(spacingL);

  /// large Margin values for consistent layout spacing
  EdgeInsets get marginXL => EdgeInsets.all(spacingXL);

  /// Creates a gap (spacer) widget, either a custom widget or a SizedBox
  Widget gap({Widget? customWidget, double? height, double? width}) {
    if (customWidget != null) {
      return customWidget;

      /// Use a custom widget if provided
    }
    return SizedBox(height: height ?? spacingM, width: width ?? spacingM);

    /// Default to a SizedBox spacer
  }

  /// Predefined gaps for convenience
  Widget gapXS() => gap(height: spacingXS);

  /// small Predefined gaps for convenience
  Widget gapS() => gap(height: spacingS);

  /// Mediam Predefined gaps for convenience
  Widget gapM() => gap(height: spacingM);

  /// Large Predefined gaps for convenience
  Widget gapL() => gap(height: spacingL);

  /// extra Large Predefined gaps for convenience
  Widget gapXL() => gap(height: spacingXL);

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
