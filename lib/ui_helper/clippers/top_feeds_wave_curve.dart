import 'package:flutter/material.dart';

class TopFeedsWaveCurve extends CustomClipper<Path> {
  final double innerWidth = 250;
  final double innerHeight = 32;
  final double topOffset = 5;

  @override
  Path getClip(Size size) {
    final halfW = innerWidth / 2;
    final height = innerHeight + topOffset;
    final path = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, topOffset)
      ..lineTo(size.width / 2 - halfW - innerHeight, topOffset)
      ..cubicTo(
        size.width / 2 - halfW,
        topOffset,
        size.width / 2 - halfW,
        height,
        size.width / 2 - halfW + innerHeight,
        height,
      )
      ..lineTo(size.width / 2 + halfW - innerHeight, height)
      ..cubicTo(
        size.width / 2 + halfW,
        height,
        size.width / 2 + halfW,
        topOffset,
        size.width / 2 + halfW + innerHeight,
        topOffset,
      )
      ..lineTo(size.width, topOffset)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
