import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_config.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/ui_helper/widgets/logo_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        ClipRRect,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        Curves,
        Divider,
        Drawer,
        DrawerHeader,
        EdgeInsets,
        Expanded,
        FlatButton,
        Icon,
        IconButton,
        Icons,
        LinearGradient,
        ListTile,
        ListView,
        MainAxisAlignment,
        Offset,
        Padding,
        Positioned,
        Row,
        Shadow,
        SizedBox,
        Spacer,
        Stack,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextAlign,
        TextDecoration,
        TextSpan,
        TextStyle,
        Material,
        Theme,
        Widget;
import 'package:provider/provider.dart';

class ApplicationDrawer extends StatefulWidget {
  @override
  _ApplicationDrawerState createState() => _ApplicationDrawerState();
}

class _ApplicationDrawerState extends State<ApplicationDrawer> {
  List menuItemsList = [];

  @override
  void initState() {
    super.initState();
    menuItemsList.addAll([
      {'menuTitle': 'آمار', 'menuAction': () => print('action 1')},
      {'menuTitle': 'تبلیغات', 'menuAction': () => print('action 2')},
      {'menuTitle': 'آرشیو', 'menuAction': () => print('action 3')},
      {'menuTitle': 'پستهای ذخیره شده', 'menuAction': () => print('action 4')},
      {'menuTitle': 'فعالیتهای شما', 'menuAction': () => print('action 5')},
      {'menuTitle': 'تماس با ما', 'menuAction': () => print('action 6')},
      {'menuTitle': 'درباره ما', 'menuAction': () => print('action 7')}
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.lightGreen
            : Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              curve: Curves.elasticInOut,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: ThemeSwitcher(
                      builder: (context) {
                        print('${ThemeProvider.of(context).brightness}');
                        return IconButton(
                          onPressed: () {
                            ThemeSwitcher.of(context).changeTheme(
                              theme: ThemeProvider.of(context).brightness ==
                                      Brightness.light
                                  ? nebrassDarkTheme
                                  : nebrassLightTheme,
                            );
                          },
                          icon: Icon(
                            Icons.brightness_3,
                            size: 25,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: Colors.white,
                        endRadius: 50.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: Container(),
                      ),
                    ],
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: LogoAnimation(isLarge: true),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text('نبراس',
                              style: AppTheme.of(context).caption().copyWith(
                                fontFamily: 'Ghasem',
                                //color: theme.appBarTitleTextColor,
                                color: Colors.white,
                                fontSize: 30.0,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(1),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text('اپلیکیشن تخصصی بانوان',
                              style: AppTheme.of(context).caption().copyWith(
                                fontFamily: 'IranYekan',
                                color: Colors.yellow,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(1),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: ListTile.divideTiles(context: context, tiles: [
                  ...menuItemsList.map((item) => ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          "${item['menuTitle']}",
                          style: AppTheme.of(context)
                              .caption()
                              .copyWith(fontFamily: 'IranSansBold'),
                        ),
                        subtitle: Text(
                          "${item['menuTitle']}",
                          style: AppTheme.of(context)
                              .caption()
                              .copyWith(fontFamily: 'IranYekan'),
                        ),
                        onTap: () => item['menuAction'](),
                      ))
                ]).toList(),
              ),
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.1), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
            Container(
              height: 52.0,
              padding: const EdgeInsets.only(left: 25.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'تنظیمات',
                          style: AppTheme.of(context)
                              .caption()
                              .copyWith(fontFamily: 'IranYekan'),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'نسخه اپلیکیشن: ۱.۰',
                    style: AppTheme.of(context)
                        .caption()
                        .copyWith(fontFamily: 'IranYekan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
