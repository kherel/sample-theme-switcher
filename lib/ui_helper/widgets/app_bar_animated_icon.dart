import 'package:application/service/providers/app_bar_animated_icon_mode.dart';
import 'package:application/service/providers/selectable_page.dart';
import 'package:flutter/material.dart'
    show AnimatedIcon, AnimatedIcons, AnimationController, AnimationStatus, BuildContext, Center, Colors, InkWell, SingleTickerProviderStateMixin, State, StatefulWidget, ValueNotifier, Widget, required;
import 'package:provider/provider.dart';

class AppBarAnimatedIcon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppBarAnimatedIcon();
}

class _AppBarAnimatedIcon extends State<AppBarAnimatedIcon> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AppBarAnimatedIconMode>(
          builder: (context, mode, child) => ValueListenableProvider.value(
              value: mode.iconMode,
              child: Consumer<bool>(builder: (context, value, child) {
                if (value) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                return InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    if(Provider.of<SelectPageForOptions>(context, listen: false ).selectedPages.isNotEmpty) {
                      Provider.of<SelectPageForOptions>( context, listen: false ).removeAllPagesFromList( );
                      Provider.of<AppBarAnimatedIconMode>( context, listen: false ).changeIconMode( );
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                  ),
                );
              }))),
    );
  }
}
