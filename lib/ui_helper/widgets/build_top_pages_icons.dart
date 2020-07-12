import 'package:application/core/theme_manager.dart';
import 'package:application/ui_helper/clippers/top_feeds_wave_curve.dart';
import 'package:application/ui_helper/widgets/top_bar_icons/top_bar_manage_instagram_feeds_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BuildTopPagesIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => Stack(
          children: <Widget>[
            ClipPath(
              clipper: TopFeedsWaveCurve(),
              child: Container(height: 40.0, color: theme.accentColor),
            ),
            /* feed bottom post icons */
            Padding(
              padding: const EdgeInsets.only(top: 7.0, left: 5.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 40.0,
                    child: Icon(
                      Icons.face,
                      color: theme.iconColor,
                      size: 22.0,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    child: Icon(
                      FontAwesomeIcons.hashtag,
                      color: theme.iconColor,
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
