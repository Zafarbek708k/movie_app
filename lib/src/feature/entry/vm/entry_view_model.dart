import "package:flutter/material.dart";


class EntryViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  List<String> images = ["assets/images/onboarding1.png","assets/images/onboarding2.png","assets/images/onboarding1.png" ];

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }


}




