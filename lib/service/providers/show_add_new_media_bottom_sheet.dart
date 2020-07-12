import 'package:flutter/cupertino.dart';

class ShowAddNewMediaBottomSheet {
  final ValueNotifier<bool> showNewMediaBottomSheet = ValueNotifier<bool>(false);

  // ignore: use_setters_to_change_properties
  void changeNewMediaBottomSheetVisibility(){
    showNewMediaBottomSheet.value = !showNewMediaBottomSheet.value;
  }
}