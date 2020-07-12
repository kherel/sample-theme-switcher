import 'package:application/core/app_theme.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final String message;

  Dot({this.radius, this.color, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(message, style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranSansLight', color: Colors.black)),
        ),
      ),
    );
  }
}
