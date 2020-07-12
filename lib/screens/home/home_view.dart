import 'package:application/core/application_settings.dart';
import 'package:application/core/extensions.dart';
import 'package:application/service/locator.dart';
import 'package:application/service/navigation_service.dart';
import 'package:application/service/providers/selectable_page.dart';
import 'package:application/service/streams/stream_app_bar_container.dart';
import 'package:application/ui_helper/transitions/fast_switch_route_animation.dart';
import 'package:application/ui_helper/widgets/application_app_bar.dart';
import 'package:application/ui_helper/widgets/application_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application/screens/dashboard/dashboard_fragment.dart';
import 'package:application/screens/profile/user_profile_fragment.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<NavigatorState> navigatorKey =
      locator<NavigationService>().nestedNavigatorKey;
  final Map<ApplicationPages, Widget> _fragments = {
    ApplicationPages.screenDashboard: DashboardFragment(),
    ApplicationPages.screenProfile: UserProfileFragment(),
  };

  @override
  Widget build(BuildContext context) {
    final applicationMainPages = Provider.of<ApplicationSettings>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          //Provider.of<ThemeManager>( context, listen: false ).changeStatusBarColor( changeColor: false );
          if (navigatorKey.currentState.canPop()) {
            navigatorKey.currentState.pop();
            return false;
          }
          return true;
        },
        child: Scaffold(
          drawer: ApplicationDrawer(),
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                /*nested multi pages*/
                Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: kToolbarHeight),
                      child: Navigator(
                        key: navigatorKey,
                        initialRoute: ApplicationPages.screenDashboard.route,
                        onGenerateRoute: (settings) {
                          //remove all selected pages from list
                          Provider.of<SelectPageForOptions>(context,
                                  listen: false)
                              .removeAllPagesFromList();
                          //set default statusBar and navigationBar color
                          //Provider.of<ThemeManager>(context, listen: false).changeStatusBarColor(changeColor: false);

                          if (settings.name == 'screenDashboard') {
                            Provider.of<StreamAppBarContainer>(context,
                                    listen: false)
                                .changeAppBarContainer(appBarPages.values[0]);
                          } else if (settings.name == 'screenProfile') {
                            //Provider.of<StreamAppBarContainer>(context, listen: false).changeAppBarContainer(appBarPages.values[1]);
                          }
                          final page = _fragments.keys.firstWhere((element) =>
                              describeEnum(element) == settings.name);

                          return FastSwitchRouteAnimation(
                              page: _fragments[page]);
                        },
                      ),
                    ),

                    /*application appbar*/
                    Material(
                      elevation: 8.0,
                      child: Container(
                        height: kToolbarHeight,
                        child: ApplicationAppBar(
                          title: 'ایـنـسـتـاچـیـتـا',
                        ),
                      ),
                    ),

                    /*bottom navigation bar*/
                    //BottomBarMenu(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
