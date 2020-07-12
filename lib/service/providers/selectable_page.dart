import 'package:flutter/cupertino.dart';

class SelectPageForOptions with ChangeNotifier {
  final List<SelectedPage> _selectedPage = [];

  List<SelectedPage> get selectedPages => _selectedPage;

  void addSelectedPageToList(SelectedPage currentPage) {
    _selectedPage.add(currentPage);
    notifyListeners();
  }

  void removePageFromList(SelectedPage selectedPage) {
    _selectedPage.removeWhere((element) => element.username == selectedPage.username);
    notifyListeners();
  }

  void removeAllPagesFromList() {
    if(_selectedPage.isNotEmpty) {
      _selectedPage?.clear( );
      notifyListeners( );
    }
  }
}

class SelectedPage {
  final String username;
  final String pageProfileImage;
  final int position;
  SelectedPage(this.username, this.pageProfileImage,this.position);
}
