import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> nestedNavigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return nestedNavigatorKey.currentState.pushNamed(routeName);
  }
}
