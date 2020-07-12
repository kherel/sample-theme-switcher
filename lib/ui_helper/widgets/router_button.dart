import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/ui_helper/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouterButton extends StatelessWidget {
  final String _buttonText;
  final String _routeName;

  const RouterButton({String buttonText, String routeName})
      : _buttonText = buttonText,
        _routeName = routeName;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, theme, child) => FlatButton(
          color: theme.appMainColor,
          textColor: Colors.white,
          splashColor: theme.accentColor,
          onPressed: () =>Routes.sailor.navigate(_routeName),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            _buttonText,
            style: AppTheme.of(context).caption().copyWith(color: theme.accentColor),
          )),
    );
  }
}
