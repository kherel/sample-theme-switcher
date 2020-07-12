import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:application/core/application_settings.dart';
import 'package:application/core/provider_setup.dart';
import 'package:application/core/theme_config.dart';
import 'package:application/screens/home/home_view.dart';
import 'package:application/service/locator.dart';
import 'package:application/ui_helper/router.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //CustomImageCache();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  setupLocator();
  Routes.createRoutes();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  final settings = ApplicationSettings(await StreamingSharedPreferences.instance);

  independentServices.add(
    Provider(create: (_) => settings),
  );

  _setUpLogging();

  /*Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(PageInfoAdapter());*/

  runApp(MultiProvider(providers: providers, child: StartupApplication()));
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class StartupApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? nebrassLightTheme : nebrassLightTheme;
    return ThemeProvider(
      initTheme: initTheme,
      duration: Duration(milliseconds: 400),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'نبراس',
          theme: ThemeProvider.of(context),
          home: OverlaySupport(child: OKToast(child: MyHomePage())),
          onGenerateRoute: Routes.sailor.generator(),
          navigatorKey: Routes.sailor.navigatorKey,
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(body: HomeView()),
    );
  }
}

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    final ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = 1024 * 1024 * 100; // 100 MB
    return imageCache;
  }
}