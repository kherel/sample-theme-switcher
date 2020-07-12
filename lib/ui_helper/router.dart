import 'package:sailor/sailor.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static final Sailor sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      /*SailorRoute(
          name: "/home",
          builder: (context, args, params) {
            return HomeScreen();
          },
          defaultTransitions: [
            SailorTransition.fade_in,
          ]),*/
    ]);
  }
}
