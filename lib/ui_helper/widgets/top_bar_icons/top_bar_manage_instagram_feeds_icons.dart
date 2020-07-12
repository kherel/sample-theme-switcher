import 'package:application/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TopBarManageInstagramFeedsIcons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopBarManageInstagramFeedsIcons();
}

class _TopBarManageInstagramFeedsIcons extends State<TopBarManageInstagramFeedsIcons> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, theme, child) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 40.0,
              child: Icon(
                FontAwesomeIcons.list,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            SizedBox(
              width: 40.0,
              child: Icon(
                FontAwesomeIcons.grimace,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            SizedBox(
              width: 40.0,
              child: Icon(
                FontAwesomeIcons.grimace,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            SizedBox(
              width: 40.0,
              child: Icon(
                FontAwesomeIcons.hashtag,
                color: Colors.white,
                size: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
