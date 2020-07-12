import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  AppTheme._(this.context);

  // ignore: prefer_constructors_over_static_methods
  static AppTheme of(BuildContext context) => AppTheme._(context); // pass context to above constructor

  TextStyle caption() {
    return Theme.of(context).textTheme.caption.copyWith(
      fontFamily: 'IranSansLight',
      color: Colors.black,
    );
  }

  TextStyle subTitle() {
    return Theme.of(context).textTheme.subtitle1.copyWith(
        fontFamily: 'IranSansLight',
        color: Colors.black
    );
  }
  TextStyle headLine() {
    return Theme.of(context).textTheme.headline2.copyWith(
        fontFamily: 'IranSansLight',
        color: Colors.black
    );
  }

  TextStyle title() {
    return Theme.of(context).textTheme.headline3.copyWith(
        fontFamily: 'IranSansLight',
        color: Colors.black
    );
  }

  TextStyle overLine() {
    return Theme.of(context).textTheme.overline.copyWith(
        fontFamily: 'IranSansLight',
        color: Colors.black
    );
  }
}
