import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_manager.dart';
import 'package:flutter/material.dart'
    show
    AnimatedSize,
    BoxConstraints,
    BuildContext,
    Colors,
    Column,
    ConstrainedBox,
    Container,
    CrossAxisAlignment,
    EdgeInsets,
    Expanded,
    FlatButton,
    InkWell,
    MainAxisAlignment,
    Padding,
    Row,
    State,
    StatefulWidget,
    Text,
    TextAlign,
    TextOverflow,
    TextStyle,
    TickerProviderStateMixin,
    Widget,
    required;
import 'package:provider/provider.dart';

class ExpandableText extends StatefulWidget {
  final String _text;

  const ExpandableText({@required String text}) : _text = text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with TickerProviderStateMixin<ExpandableText> {
  String get text => widget._text;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, theme, child) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(
          text,
          maxLines: isExpanded ? 120 : 2,
          textAlign: TextAlign.start,
          style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan'),
        ),
        InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              margin: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(margin: const EdgeInsets.only(left: 10.0, top: 3.0), width: double.infinity, height: 1.0, color: Colors.black12),
                  ),
                  if (isExpanded)
                    Text(
                      "کمتر",
                      style: AppTheme.of(context).caption().copyWith(color: theme.appMainColor),
                    )
                  else
                    Text("ادامه", style: AppTheme.of(context).caption().copyWith(color: theme.appMainColor))
                ],
              ),
            ))
      ]),
    );
  }
}
