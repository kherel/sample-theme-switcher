//https://stackoverflow.com/questions/56917369/flutter-change-wave-quadraticbezierto-points
import 'package:flutter/material.dart';

class FeedsBottomWaveBackground extends CustomClipper<Path> {
   FeedsBottomWaveBackground();

   final int _coefficient = 10;
   double get _minStep => 1 / _coefficient;
   double get _preCenter => _minStep * (_coefficient / 2 - 1);
   double get _postCenter => _minStep * (_coefficient / 2 + 1);
   double get _preEnd => _minStep * (_coefficient - 1);

   @override
   Path getClip(Size size) {
      final path = Path();
      path.moveTo(0.0, 0.0);
      path.lineTo(0.0, 7);
      path.lineTo(size.width * _preCenter, 7.0);
      path.cubicTo(size.width/2, 7.0, size.width/2, 45.0, size.width * _postCenter, 45.0);
      path.lineTo(size.width * _preEnd, 45.0);
      path.quadraticBezierTo(size.width, 45, size.width, 7.0);
      path.lineTo(size.width, 0.0);
      path.close();

      return path;
   }

   @override
   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}