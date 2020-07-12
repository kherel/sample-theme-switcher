import 'package:flutter/cupertino.dart';

class NewMediaFabButtonVisibility{
  final ValueNotifier<bool> newMediaFabButtonVisibility = ValueNotifier<bool>(true);

  // ignore: use_setters_to_change_properties
  void changeNewMediaFabButton({bool visible = true}){
    newMediaFabButtonVisibility.value = visible;
  }
}