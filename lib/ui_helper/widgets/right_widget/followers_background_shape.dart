import 'package:flutter/material.dart';

class FollowersBackgroundShape extends ShapeBorder {
  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  Path _getPath(Rect rect) {
    final size = rect.size;
    final delta = size.height / 9;
    final ctrl = delta * 0.9;
    return Path()
      ..moveTo(rect.centerRight.dx, rect.centerRight.dy)
      ..relativeCubicTo(0, ctrl, -delta, delta-ctrl/2, -delta, delta)
      ..relativeCubicTo(0, ctrl/2, delta, delta-ctrl, delta, delta)
      ..addRect(rect)
      ..close();
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(0);
  }

  @override
  ShapeBorder scale(double t) {
    return FollowersBackgroundShape();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  }
}
