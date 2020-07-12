import 'package:flutter/material.dart' show ValueNotifier;

class ScreenToolsVisibility{
  final ValueNotifier<bool> screenToolsVisibility = ValueNotifier<bool>(false);

  // ignore: use_setters_to_change_properties
  void changeScreenToolsVisibility({bool hide = false}){
    screenToolsVisibility.value = hide;
  }
}