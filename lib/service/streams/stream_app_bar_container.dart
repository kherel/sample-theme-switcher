import 'dart:async';

enum appBarPages { dashboard, profile, activity, search }

class StreamAppBarContainer {
  final StreamController<appBarPages> _appBarPage = StreamController<appBarPages>();

  Stream<appBarPages> get selectedPage => _appBarPage.stream;

  void changeAppBarContainer(appBarPages _pageENum) {
    _appBarPage.add(_pageENum);
  }

  StreamAppBarContainer() {
    //_selectedAppBarPage.add( appBarPages.dashboard);
  }
}
