import 'package:application/core/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiddleTextDecoration extends StatelessWidget {
  final String primaryText, secondText;
  final Color backgroundColor;

  const MiddleTextDecoration({@required this.primaryText, @required this.secondText, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Container(
          margin: const EdgeInsets.only(top: 16.0),
          width: 250.0,
          height: 2.0,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                constraints: const BoxConstraints(minWidth: 50.0, minHeight: 25.0),
                margin: const EdgeInsets.only(top: 4.0),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        primaryText,
                        style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan', color: Colors.black),
                      ),
                    ))),
            if (secondText.isNotEmpty)
              Container(
                  constraints: const BoxConstraints(
                    minWidth: 25.0,
                    minHeight: 25.0,
                  ),
                  margin: const EdgeInsets.only(top: 2.0, right: 5.0),
                  decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '$secondText',
                          style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan', color: Colors.black),
                        ),
                      )))
            else
              Container(),
          ],
        ),
      ),
    ]);
  }
}
