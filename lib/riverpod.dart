

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:movie_app/src/feature/entry/vm/entry_view_model.dart";
import "package:movie_app/src/feature/home/vm/home_view_model.dart";
import "package:movie_app/src/feature/settings/locale_controller.dart";
import "package:movie_app/src/feature/settings/theme_controller.dart";

final theme = ChangeNotifierProvider((ref) => ThemeController());
final locale = ChangeNotifierProvider((ref) => LocalController());


  // splash onBoarding
final entryController = ChangeNotifierProvider((ref) => EntryViewModel());

final homeController = ChangeNotifierProvider((ref) => HomeViewModel());
