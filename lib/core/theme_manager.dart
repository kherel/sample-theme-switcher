import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart' show Color, Colors, TextStyle, TextTheme, ThemeData, debugPrint;
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

enum applicationThemes { purple, blue }

class ThemeManager {
  Color pageBackgroundColor = const Color(0xFFF1F5FF);
  Color accentColor = const Color(0xFFD1D8EC);
  Color appMainColor = const Color(0xFF677493);
  Color textColor = const Color(0xFFe8ebf2);
  Color iconColor = const Color(0xFF323c53);
  Color appBarTextColor = const Color(0xFFD1D8EC);
  Color appBarTitleTextColor = const Color(0xFFFFFFFF);
  Color floatingActionButtonColor = const Color(0xFF3c475f);
  Color feedsHeaderIcon = const Color(0xFFaeb7d2);
  final StreamController<ThemeData> _themeController = StreamController<ThemeData>();
  final List<ThemeData> _availableThemes = [
    ThemeData(
        fontFamily: 'IranSansLight',
        primaryColor: const Color(0xFF677493),
        accentColor: const Color(0xFF525D76),
        canvasColor: Colors.transparent,
        buttonColor: const Color(0xFF3A455C),
        textTheme: const TextTheme(headline6: TextStyle(fontFamily: 'IranSansLight', color: Colors.black))),
    ThemeData(
        fontFamily: 'IranSansLight',
        primaryColor: const Color(0xFF171932),
        accentColor: const Color(0xFF171932),
        canvasColor: Colors.transparent,
        buttonColor: const Color(0xFF3A455C),
        textTheme: const TextTheme(headline6: TextStyle(fontFamily: 'IranSansLight', color: Colors.black))),
  ];

  Stream<ThemeData> get theme => _themeController.stream;

  Future changeTheme() async {
    final int themeId = Random().nextInt(2);
    //print(themeId);
    final themeToApply = _availableThemes[themeId];
    switch (themeId) {
      case 0:
        pageBackgroundColor = const Color(0xFFF1F5FF);
        accentColor = const Color(0xFFD1D8EC);
        appMainColor = const Color(0xFF677493);
        textColor = const Color(0xFFFFFFFF);
        appBarTextColor = const Color(0xFFD1D8EC);
        iconColor = const Color(0xFFD1D8EC);
        appBarTitleTextColor = const Color(0xFFFFFFFF);
        floatingActionButtonColor = const Color(0xFF3c475f);
        break;
      case 1:
        accentColor = const Color(0xFF171932);
        pageBackgroundColor = const Color(0xFF202340);
        textColor = Colors.white;
        break;
    }
    await changeStatusBarColor(changeColor: false);
    _themeController.add(themeToApply);
  }

  Future changeStatusBarColor({bool changeColor = false}) async {
    ThemeData themeData;

    if (changeColor) {
      themeData = ThemeData(primaryColor: const Color(0xFF677493), backgroundColor: const Color(0xFFD1D8EC), accentColor: const Color(0xFF757575));
    } else {
      themeData = ThemeData(primaryColor: const Color(0xFF677493), backgroundColor: const Color(0xFFD1D8EC), accentColor: const Color(0xFF525D76));
    }

    try {
      //await FlutterStatusbarcolor.setNavigationBarColor(themeData?.accentColor, animate: true);
      /*if (useWhiteForeground(themeData.accentColor)) {
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      } else {
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      }*/

      await FlutterStatusbarcolor.setStatusBarColor(themeData?.accentColor, animate: true);
      if (useWhiteForeground(themeData.accentColor)) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      } else {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
