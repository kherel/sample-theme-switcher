import 'package:flutter/material.dart';

class FastSwitchRouteAnimation extends PageRouteBuilder {
  final Widget page;

  FastSwitchRouteAnimation({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn),
            child: child,
          ),
        );
}
