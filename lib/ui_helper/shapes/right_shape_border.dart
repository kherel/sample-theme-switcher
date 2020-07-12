import 'package:flutter/material.dart';

class RightShapeBorder extends ShapeBorder {
  final Size thumbSize;
  final Alignment alignment;
  final double barWidth;

  const RightShapeBorder(
      this.thumbSize,
      this.alignment,
      this.barWidth,
      );

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

  Path _getPath(Rect rect) {
    final delta = thumbSize.width;
    final ctrl = delta * 0.75;
    final th2 = thumbSize.height / 2;
    final thumbRect = alignment.inscribe(thumbSize + Offset(barWidth, 0), rect);
    final bar = Rect.fromLTWH(thumbRect.right - barWidth, rect.top, barWidth, rect.height);
    return Path()
      ..moveTo(thumbRect.right - barWidth, thumbRect.top)
      ..relativeCubicTo(0, ctrl, -delta, th2 - ctrl, -delta, th2)
      ..relativeCubicTo(0, ctrl, delta, th2 - ctrl, delta, th2)
      ..addRect(bar)
      ..close();
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.all(0);
  }

  @override
  ShapeBorder scale(double t) {
    return RightShapeBorder(thumbSize, alignment, barWidth);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}
}
