import 'package:application/core/app_theme.dart';
import 'package:flutter/material.dart';

class BuildPagesMoreOptions extends StatelessWidget {
  final List<MenuItems> _menuItems = [
    MenuItems(menuTitle: 'test1 ', icon: Icons.settings),
    MenuItems(menuTitle: 'test2 ', icon: Icons.list),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          margin: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ...List.generate(
                    _menuItems.length,
                        (index) => Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            _menuItems[index].menuTitle,
                            style: AppTheme.of(context).caption(),
                          ),
                          leading: Icon(_menuItems[index].icon),
                        ),
                        const Divider(height: 5.0,),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

class MenuItems {
  final String menuTitle;
  final IconData icon;

  MenuItems({@required this.menuTitle, @required this.icon});
}
