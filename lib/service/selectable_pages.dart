import 'dart:math';

import 'package:flutter/cupertino.dart';

class SelectablePages {
  final ValueNotifier<int> selectedPage = ValueNotifier(0);

  // ignore: use_setters_to_change_properties
  void selectedPageCounter() {
    selectedPage.value = selectedPage.value == 0 ? selectedPage.value + 1: 0;
  }
}
