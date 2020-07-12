import 'package:application/core/app_theme.dart';
import 'package:flutter/material.dart';

class TextWithCut extends StatelessWidget {
  const TextWithCut(this.text, {Key key, this.style}) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? AppTheme.of(context).caption();
    final symbolWidth = style.fontSize * 0.4;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (text.length > 10) {
          final numberOfElements = (constraints.maxWidth / symbolWidth).floor();
          return Text(middleCut(text, numberOfElements), style: style);
        } else {
          return Text(text, style: style);
        }
      },
    );
  }

  String middleCut(String text, int length) {
    const numberOfDots = 3;
    final dotsString = List<String>.filled(numberOfDots, '.').join();

    final leftSizeLength = ((length - numberOfDots) / 2).floor();
    final rightSizeLength = text.length - leftSizeLength;
    final leftPart = text.substring(0, leftSizeLength);
    final rightPart = text.substring(rightSizeLength);
    return '$leftPart$dotsString$rightPart';
  }
}
