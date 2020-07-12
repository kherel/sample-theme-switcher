import 'package:flutter/material.dart' show ValueNotifier;

class AppBarAnimatedIconMode {
  final ValueNotifier<bool> iconMode = ValueNotifier<bool>(false);

  // ignore: use_setters_to_change_properties
  void changeIconMode() {
    iconMode.value = !iconMode.value;
  }
}
