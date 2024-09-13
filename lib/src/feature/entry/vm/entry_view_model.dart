import "package:flutter/material.dart";


class EntryViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }


}




