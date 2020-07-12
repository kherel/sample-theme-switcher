import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ApplicationSettings {
  ApplicationSettings(StreamingSharedPreferences preferences)
      : bottomSheetListType = preferences.getInt('bottomSheetListType', defaultValue: 2),
        isShownNewMediaFabButton = preferences.getBool('newMediaFabButtonVisibility', defaultValue: true),
        currentPageName = preferences.getString('currentPageName', defaultValue: 'screenDashboard');

  final Preference<int> bottomSheetListType;
  final Preference<String> currentPageName;
  final Preference<bool> isShownNewMediaFabButton;
}
