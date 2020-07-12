import 'package:application/core/global_bloc.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/service/providers/app_bar_animated_icon_mode.dart';
import 'package:application/service/providers/barrier_effect_visibility.dart';
import 'package:application/service/providers/selectable_page.dart';
import 'package:application/service/providers/screen_tools_visibility.dart';
import 'package:application/service/providers/show_add_new_media_bottom_sheet.dart';
import 'package:application/service/providers/show_hide_new_media_fab_button.dart';
import 'package:application/service/streams/stream_app_bar_container.dart';
import 'package:application/service/selectable_pages.dart';
import 'package:flutter/material.dart' show ThemeData;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...independentServices, ...dependentServices, ...uiConsumableProviders];
List<SingleChildWidget> independentServices = [
  Provider(
    create: (_) => SelectablePages(),
  ),
  Provider(
    create: (_) => ShowAddNewMediaBottomSheet(),
  ),
  Provider(
    create: (_) => ScreenToolsVisibility(),
  ),
  Provider(
    create: (_) => AppBarAnimatedIconMode(),
  ),
  Provider(
    create: (_) => NewMediaFabButtonVisibility(),
  ),
  Provider(
    create: (_) => BarrierEffectVisibility(),
  ),
  Provider(
    create: (_) => GlobalBloc(),
  ),
  ChangeNotifierProvider(
    create: (_) => SelectPageForOptions(),
  ),
];
List<SingleChildWidget> dependentServices = [];
List<SingleChildWidget> uiConsumableProviders = [
  Provider.value(value: ThemeManager()),
  StreamProvider<ThemeData>(
    create: (context) => Provider.of<ThemeManager>(context, listen: false).theme,
  ),
  Provider.value(value: StreamAppBarContainer()),
  StreamProvider<appBarPages>(
    create: (context) => Provider.of<StreamAppBarContainer>(context, listen: false).selectedPage,
  ),
];
