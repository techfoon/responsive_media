import './responsive_media.dart';

/// Extension on [num] to provide responsive values for height, width,
/// shortest side, and longest side based on the screen dimensions.
extension ResponsiveValues on num {
  /// Returns a responsive height value based on the screen height.
  double get rh => ResponsiveMedia.instance.fromHeight(toDouble());

  /// Returns a responsive width value based on the screen width.
  double get rw => ResponsiveMedia.instance.fromWidth(toDouble());

  /// Returns a responsive value based on the shortest side of the screen.
  double get rs => ResponsiveMedia.instance.shortestSide * toDouble();

  /// Returns a responsive value based on the longest side of the screen.
  double get rl => ResponsiveMedia.instance.longestSide * toDouble();
}
