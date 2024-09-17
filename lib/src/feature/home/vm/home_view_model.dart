import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_advanced_drawer/flutter_advanced_drawer.dart";
import "package:go_router/go_router.dart";

import "../../../core/routes/app_route_name.dart";

class HomeViewModel extends ChangeNotifier {
  late AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }

  void onPageChanged({required int index, required BuildContext context}) {
    switch (index) {
      case 0:
        context.go(AppRouteName.home);
        break;
      case 1:
        context.go(AppRouteName.search);
        break;
      case 2:
        context.go(AppRouteName.watchList);
        break;
      default:
        context.go(AppRouteName.home);
        break;
    }
    updateIndex(index);
  }

}

