import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/ui_helper/popup_routes.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DashboardIcons extends StatefulWidget {
  final BottomBarController bottomBarController;

  const DashboardIcons({@required this.bottomBarController});

  @override
  _DashboardIconsState createState() => _DashboardIconsState();
}

class _DashboardIconsState extends State<DashboardIcons> {
  BottomBarController get _bottomBarController => widget.bottomBarController;
  List bottomMenusList = [];

  @override
  void initState() {
    super.initState();
    bottomMenusList.addAll([
      {
        'menuTitle': 'مدیریت هشتگها',
        'menuSubTitle': 'مدیریت فهرست هشتگهای کاربردی',
        'image': 'assets/images/icons/hashtags.jpg',
        'action': () =>_manageHashtags()
      },
      {
        'menuTitle': 'فروشگاه',
        'menuSubTitle': 'مدیریت غرفه محصولات در نمایشگاه',
        'image': 'assets/images/icons/hashtags.jpg',
        'action': () {
          print('bbbb');
        }
      },
      {
        'menuTitle': 'کسب درآمد',
        'menuSubTitle': 'منبع درآمدزی از تبلیغات در کادر پستهای شما',
        'image': 'assets/images/icons/hashtags.jpg',
        'action': () => print('cccc')
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              padding: const EdgeInsets.only(bottom: 10.0),
              height: 75.0,
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  ...bottomMenusList.map((menu) => Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                        decoration: BoxDecoration(color: theme.accentColor, borderRadius: const BorderRadius.all(Radius.circular(5.0)), boxShadow: [
                          BoxShadow(
                            blurRadius: 0.1,
                            color: Colors.black,
                            offset: const Offset(0.0, 0.0),
                          )
                        ]),
                        child: ListTile(
                          title: Text(
                            "${menu['menuTitle']}",
                            style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranSansBold'),
                          ),
                          subtitle: Text(
                            "${menu['menuSubTitle']}",
                            style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan'),
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 45.0,
                                height: 45.0,
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(50.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 1.0,
                                        offset: const Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                        "${menu['image']}",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ],
                          ),
                          onTap: () => menu['action'](),
                        ),
                      )),
                ],
              ),
            ));
  }

  void _manageHashtags() {
    _bottomBarController.close();
    /*PopupRoutes.show(context, ManageHashTags(), directions.rightToLeft,true).then((value) {
      _bottomBarController.open();
    });*/
  }
}