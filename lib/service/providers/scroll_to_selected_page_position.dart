import 'package:flutter/cupertino.dart';

class ScrollToSelectedPagePosition {
  final ValueNotifier<int> position = ValueNotifier<int>(0);

  // ignore: use_setters_to_change_properties
  void scrollToPosition(int selectedPagePosition){
    position.value = selectedPagePosition;
  }
}