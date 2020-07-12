import 'dart:math';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart' show BuildContext, Image, StatelessWidget, Transform, Tween, Widget, required;

class LogoAnimation extends StatelessWidget {
  final bool isLarge;

  const LogoAnimation({@required this.isLarge});

  @override
  Widget build(BuildContext context) {
    return Animator(
      tween: Tween<double>(begin: 0, end: 2 * pi),
      duration: const Duration(seconds: 30),
      resetAnimationOnRebuild: false,
      repeats: 0,
      builder: (anim) => Transform.rotate(
        angle: anim.value as double,
        child: Image.asset(
          'assets/images/ic_app_logo.png',
          width: isLarge ? 90.0 : 40.0,
        ),
      ),
    );
  }
}
