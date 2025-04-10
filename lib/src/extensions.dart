
import './responsive_media.dart';

extension ResponsiveValues on num {
  double get rh => ResponsiveMedia.instance.fromHeight(toDouble());
  double get rw => ResponsiveMedia.instance.fromWidth(toDouble());
  double get rs => ResponsiveMedia.instance.shortestSide * toDouble();
}
