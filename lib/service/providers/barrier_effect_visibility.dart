import 'package:flutter/material.dart' show ValueNotifier;

class BarrierEffectVisibility {
  ValueNotifier<bool> barrierVisibility = ValueNotifier<bool>(false);

  // ignore: use_setters_to_change_properties
  void changeBarrierEffectVisibility({bool visible = false}) {
    barrierVisibility.value = visible;
  }
}
