import 'package:animator/animator.dart';
import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/service/providers/selectable_page.dart';
import 'package:application/service/streams/stream_app_bar_container.dart';
import 'package:application/ui_helper/widgets/app_bar_animated_icon.dart';
import 'package:application/ui_helper/widgets/fade.dart';
import 'package:application/ui_helper/widgets/logo_animation.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart'
    show
        AbsorbPointer,
        Align,
        Alignment,
        Animation,
        AnimationController,
        AppBar,
        BorderRadius,
        BorderSide,
        BoxDecoration,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        CurvedAnimation,
        Curves,
        Directionality,
        EdgeInsets,
        Icon,
        IconButton,
        IconThemeData,
        Icons,
        InputDecoration,
        MainAxisAlignment,
        Offset,
        Opacity,
        OutlineInputBorder,
        Padding,
        PreferredSizeWidget,
        Radius,
        Row,
        Shadow,
        Size,
        SizeTransition,
        SizedBox,
        Spacer,
        Stack,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextAlign,
        TextDirection,
        TextFormField,
        TextInputAction,
        TextInputType,
        TickerProviderStateMixin,
        Widget,
        kToolbarHeight,
        required;

import 'avatar_widget.dart';

class ApplicationAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  ApplicationAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SelectPageForOptions, appBarPages>(
      builder: (context, page, selectedAppBarContainer, child) {
        Widget v;
        if (selectedAppBarContainer == appBarPages.dashboard) {
          v = DashBoardAppBar(appBarTitle: title);
        } else if (selectedAppBarContainer == appBarPages.profile) {
          v = ProfileAppBar();
        } else if (selectedAppBarContainer == appBarPages.activity) {
          v = ActivityAppBar();
        } else if (selectedAppBarContainer == appBarPages.search) {
          v = SearchAppBar();
        } else {
          v = DashBoardAppBar(appBarTitle: title);
        }
        return AppBar(
            elevation: 8.0,
            titleSpacing: 0.0,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: page.selectedPages.isEmpty
                  ? Colors.white
                  : Colors.black, //change your color here
            ),
            //backgroundColor: page.selectedPages.isEmpty ? theme.appMainColor : Colors.white,
            //leading: AppBarAnimatedIcon( ),
            title: v);
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('SEARCH BAR');
  }
}

class ActivityAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('ACTIVITY BAR');
  }
}

class SearchAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('SEARCH BAR');
  }
}

class DashBoardAppBar extends StatefulWidget {
  final String _appBarTitle;

  const DashBoardAppBar({@required String appBarTitle})
      : _appBarTitle = appBarTitle;

  @override
  _DashBoardAppBarState createState() => _DashBoardAppBarState();
}

class _DashBoardAppBarState extends State<DashBoardAppBar> {
  String get appBarTitle => widget._appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Consumer<SelectPageForOptions>(
        builder: (context, page, child) {
          if (page.selectedPages.isNotEmpty) {
            return SelectedPagesOptionsAppBar();
          } else {
            return BuildDefaultAppBar(appBarTitle: appBarTitle);
          }
        },
      )
    ]);
  }
}

class SelectedPagesOptionsAppBar extends StatefulWidget {
  @override
  _SelectedPagesOptionsAppBarState createState() =>
      _SelectedPagesOptionsAppBarState();
}

class _SelectedPagesOptionsAppBarState extends State<SelectedPagesOptionsAppBar>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPages = Provider.of<SelectPageForOptions>(context);
    Provider.of<ThemeManager>(context, listen: false)
        .changeStatusBarColor(changeColor: true);
    return Container(
      height: 56.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (selectedPages.selectedPages.length == 1)
            Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: AvatarWidget(
                imageUrl: 'assets/images/mahdi_pishguy.jpg',
                onTap: () => {},
                isLarge: false,
                isShowingUsernameLabel: false,
                labelWidget: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.red[900],
                  ),
                ),
                //useGlowAnimation: true,
              ),
            )
          else
            Container(
                margin: const EdgeInsets.only(left: 13.0),
                child: const LogoAnimation(
                  isLarge: false,
                )),
          SizeTransition(
            sizeFactor: CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut),
            axisAlignment: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AbsorbPointer(
                  absorbing: selectedPages.selectedPages.length > 1,
                  child: IconButton(
                    onPressed: () =>
                        selectedPages.selectedPages.length > 1 ? null : null,
                    icon: Icon(FontAwesomeIcons.bell),
                    //color: selectedPages.selectedPages.length > 1 ? Colors.grey : theme.appMainColor,
                    iconSize: 19.0,
                  ),
                ),
                AbsorbPointer(
                  absorbing: selectedPages.selectedPages.length > 1,
                  child: IconButton(
                    onPressed: () =>
                        selectedPages.selectedPages.length > 1 ? null : null,
                    icon: Icon(FontAwesomeIcons.link),
                    //color: selectedPages.selectedPages.length > 1 ? Colors.grey : theme.appMainColor,
                    iconSize: 19.0,
                  ),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: Icon(FontAwesomeIcons.userMinus),
                  //color: theme.appMainColor,
                  iconSize: 19.0,
                ),
              ],
            ),
          ),
          const Spacer(),
          Fade(
              visible: true,
              repeat: true,
              child: Text(
                '${selectedPages.selectedPages.length}',
                style: AppTheme.of(context).subTitle().copyWith(),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              //color: theme.appMainColor,
              iconSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BuildDefaultAppBar extends StatefulWidget {
  final String _appBarTitle;

  const BuildDefaultAppBar({@required String appBarTitle})
      : _appBarTitle = appBarTitle;

  @override
  _BuildDefaultAppBar createState() => _BuildDefaultAppBar();
}

class _BuildDefaultAppBar extends State<BuildDefaultAppBar>
    with TickerProviderStateMixin {
  String get appBarTitle => widget._appBarTitle;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeManager>(context, listen: false)
        .changeStatusBarColor(changeColor: false);
    return Animator(
      repeats: 1,
      builder: (anim) => Opacity(
          opacity: anim.value as double,
          child: Container(
            height: 56.0,
            //color: theme.appMainColor,
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0,right: 24.0),
                      child: AppBarAnimatedIcon( ),
                    ),
                    const LogoAnimation(
                      isLarge: false,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('نبراس',
                            style: AppTheme.of(context).caption().copyWith(
                              fontFamily: 'Ghasem',
                              //color: theme.appBarTitleTextColor,
                              color: Colors.white,
                              fontSize: 24.0,
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        //color: theme.iconColor,
                        onPressed: () => _animationController.forward(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          //color: theme.iconColor,
                          size: 19.0,
                        ),
                        //color: theme.accentColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                CircularRevealAnimation(
                  animation: _animation,
                  centerOffset: const Offset(83, 30),
                  child: Container(
                    width: double.infinity,
                    height: kToolbarHeight,
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 10.0, left: 65.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                                style: AppTheme.of(context).caption(),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.0,  color:Colors.white
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.0, color:Colors.white
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(5.0),
                                  errorStyle: AppTheme.of(context).caption(),
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'جستجو کنید',
                                  hintStyle: AppTheme.of(context).caption(),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: Colors.black,
                              ),
                              color: Colors.black,
                              onPressed: () => _animationController.reverse(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
