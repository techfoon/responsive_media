
import './responsive_media.dart';

/// Advanced Breakpoints Extension for ResponsiveMedia
/// 
/// This file provides advanced breakpoint functionality including:
/// - Device type detection (isMobile, isTablet, isDesktop)
/// - Custom breakpoint support
/// - Breakpoint comparison methods

/// Extension on ResponsiveMedia to add advanced breakpoint functionality
extension AdvancedBreakpoints on ResponsiveMedia {
  /// Default breakpoint thresholds
  static const double defaultMobileBreakpoint = 768;
    /// Default breakpoint thresholds
  static const double defaultTabletBreakpoint = 1024;

  /// Determines if the current device is a mobile device
  /// Based on screen width being less than the mobile breakpoint threshold
  bool get isMobile => screenWidth < _getMobileBreakpoint();

  /// Determines if the current device is a tablet
  /// Based on screen width being between mobile and tablet breakpoint thresholds
  bool get isTablet =>
      screenWidth >= _getMobileBreakpoint() &&
      screenWidth < _getTabletBreakpoint();

  /// Determines if the current device is a desktop
  /// Based on screen width being greater than or equal to the tablet breakpoint threshold
  bool get isDesktop => screenWidth >= _getTabletBreakpoint();

  /// Get mobile breakpoint threshold
  double _getMobileBreakpoint() {
    return ResponsiveMediaBreakpointConfig.mobileBreakpoint;
  }

  /// Get tablet breakpoint threshold
  double _getTabletBreakpoint() {
    return ResponsiveMediaBreakpointConfig.tabletBreakpoint;
  }

  /// Checks if the current screen width matches a custom breakpoint
  /// Returns true if the screen width is greater than or equal to the specified breakpoint
  /// Returns false if the breakpoint name is not found in customBreakpoints
  bool isBreakpoint(String breakpointName) {
    final customBreakpoints =
        ResponsiveMediaBreakpointConfig.customBreakpoints;
    if (!customBreakpoints.containsKey(breakpointName)) {
      return false;
    }
    return screenWidth >= customBreakpoints[breakpointName]!;
  }

  /// Checks if the current screen width is larger than a custom breakpoint
  /// Returns true if the screen width is strictly greater than the specified breakpoint
  /// Returns false if the breakpoint name is not found in customBreakpoints
  bool largerThan(String breakpointName) {
    final customBreakpoints =
        ResponsiveMediaBreakpointConfig.customBreakpoints;
    if (!customBreakpoints.containsKey(breakpointName)) {
      return false;
    }
    return screenWidth > customBreakpoints[breakpointName]!;
  }

  /// Checks if the current screen width is smaller than a custom breakpoint
  /// Returns true if the screen width is strictly less than the specified breakpoint
  /// Returns false if the breakpoint name is not found in customBreakpoints
  bool smallerThan(String breakpointName) {
    final customBreakpoints =
        ResponsiveMediaBreakpointConfig.customBreakpoints;
    if (!customBreakpoints.containsKey(breakpointName)) {
      return false;
    }
    return screenWidth < customBreakpoints[breakpointName]!;
  }

  /// Checks if the current screen width is between two custom breakpoints
  /// Returns true if the screen width is within the range (inclusive of start, exclusive of end)
  /// Returns false if either breakpoint name is not found in customBreakpoints
  bool between(String startBreakpoint, String endBreakpoint) {
    final customBreakpoints =
        ResponsiveMediaBreakpointConfig.customBreakpoints;
    if (!customBreakpoints.containsKey(startBreakpoint) ||
        !customBreakpoints.containsKey(endBreakpoint)) {
      return false;
    }
    return screenWidth >= customBreakpoints[startBreakpoint]! &&
        screenWidth < customBreakpoints[endBreakpoint]!;
  }

  /// Returns the name of the current active custom breakpoint
  /// Returns the largest breakpoint name that the screen width satisfies
  /// Returns 'unknown' if no custom breakpoints are defined or matched
  String get currentBreakpoint {
    final customBreakpoints =
        ResponsiveMediaBreakpointConfig.customBreakpoints;
    if (customBreakpoints.isEmpty) {
      return 'unknown';
    }

    // Sort breakpoints by value in descending order
    final sortedBreakpoints = customBreakpoints.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Return the first (largest) breakpoint that the screen width satisfies
    for (var entry in sortedBreakpoints) {
      if (screenWidth >= entry.value) {
        return entry.key;
      }
    }

    return 'unknown';
  }

  /// Returns a value based on device type
  /// Useful for returning different values for mobile, tablet, and desktop
  T valueByDevice<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isDesktop) return desktop;
    if (isTablet) return tablet;
    return mobile;
  }

  /// Returns a value based on custom breakpoint
  /// Returns the value associated with the current active breakpoint
  /// Returns defaultValue if no matching breakpoint is found
  T valueByBreakpoint<T>({
    required Map<String, T> breakpointValues,
    required T defaultValue,
  }) {
    final current = currentBreakpoint;
    return breakpointValues[current] ?? defaultValue;
  }
}

/// Configuration class for managing breakpoint settings
/// This class holds the global breakpoint configuration
class ResponsiveMediaBreakpointConfig {
  /// Custom breakpoints map
  static Map<String, double> customBreakpoints = {};

  /// Mobile breakpoint threshold
  static double mobileBreakpoint = 768;

  /// Tablet breakpoint threshold
  static double tabletBreakpoint = 1024;

  /// Initialize breakpoint configuration
  /// Call this method before using ResponsiveMedia.init()
  /// or pass these values directly to ResponsiveMedia.init()
  static void configure({
    Map<String, double>? customBreakpoints,
    double? mobileBreakpoint,
    double? tabletBreakpoint,
  }) {
    if (customBreakpoints != null) {
      ResponsiveMediaBreakpointConfig.customBreakpoints = customBreakpoints;
    }
    if (mobileBreakpoint != null) {
      ResponsiveMediaBreakpointConfig.mobileBreakpoint = mobileBreakpoint;
    }
    if (tabletBreakpoint != null) {
      ResponsiveMediaBreakpointConfig.tabletBreakpoint = tabletBreakpoint;
    }
  }

  /// Reset breakpoint configuration to default values
  static void reset() {
    customBreakpoints = {};
    mobileBreakpoint = AdvancedBreakpoints.defaultMobileBreakpoint;
    tabletBreakpoint = AdvancedBreakpoints.defaultTabletBreakpoint;
  }

  /// Add a single custom breakpoint
  static void addBreakpoint(String name, double width) {
    customBreakpoints[name] = width;
  }

  /// Remove a custom breakpoint
  static void removeBreakpoint(String name) {
    customBreakpoints.remove(name);
  }

  /// Check if a breakpoint exists
  static bool hasBreakpoint(String name) {
    return customBreakpoints.containsKey(name);
  }

  /// Get all breakpoint names
  static List<String> get breakpointNames => customBreakpoints.keys.toList();

  /// Get breakpoint value by name
  static double? getBreakpointValue(String name) {
    return customBreakpoints[name];
  }
}

/// Common predefined breakpoint sets for quick setup
class CommonBreakpoints {
  /// Bootstrap-style breakpoints
  static Map<String, double> get bootstrap => {
        'xs': 0,
        'sm': 576,
        'md': 768,
        'lg': 992,
        'xl': 1200,
        'xxl': 1400,
      };

  /// Material Design breakpoints
  static Map<String, double> get material => {
        'compact': 0,
        'medium': 600,
        'expanded': 840,
        'large': 1240,
        'extraLarge': 1600,
      };

  /// Tailwind CSS breakpoints
  static Map<String, double> get tailwind => {
        'sm': 640,
        'md': 768,
        'lg': 1024,
        'xl': 1280,
        '2xl': 1536,
      };

  /// Device-specific breakpoints
  static Map<String, double> get devices => {
        'mobileSmall': 320,
        'mobileMedium': 375,
        'mobileLarge': 425,
        'tablet': 768,
        'laptop': 1024,
        'laptopLarge': 1440,
        'desktop': 1920,
        '4k': 2560,
      };

  /// Apple device breakpoints
  static Map<String, double> get apple => {
        'iPhoneSE': 375,
        'iPhone': 390,
        'iPhoneMax': 428,
        'iPadMini': 768,
        'iPad': 810,
        'iPadPro': 1024,
        'macBook': 1440,
        'iMac': 1920,
      };

  /// Web-focused breakpoints
  static Map<String, double> get web => {
        'mobile': 480,
        'tablet': 768,
        'desktop': 1024,
        'wide': 1440,
        'ultraWide': 1920,
      };
}
