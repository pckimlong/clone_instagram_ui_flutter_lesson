import '../pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class NavigateProvider extends ChangeNotifier {
  var initPage = IgPage.home;
  void changePage(IgPage page) {
    initPage = page;
    notifyListeners();
  }
}
