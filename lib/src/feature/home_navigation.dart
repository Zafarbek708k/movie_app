import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/constants/context_extension.dart';
import 'package:movie_app/src/core/widgets/blur_widget.dart';



class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: widget.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10), // Adjust the bottom padding to 0
        child: BlurWidget(
          blur: 10,
          radius: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                selectedLabelStyle: context.appTextStyle.bodyLarge,
                unselectedLabelStyle: context.appTextStyle.bodyMedium,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                unselectedItemColor: Colors.blueGrey,
                selectedItemColor: Colors.blue,
                elevation: 0,
                backgroundColor: context.appTheme.primary,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Watch List"),
                ],
                currentIndex: widget.navigationShell.currentIndex,
                onTap: (index) => _onItemTapped(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}



Widget a (BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedLabelStyle: context.appTextStyle.bodyLarge,
          unselectedLabelStyle: context.appTextStyle.bodyMedium,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.blue,
          elevation: 0,
          backgroundColor: context.appTheme.primary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Watch List"),
            // _navBarItem("UiKitAssets.icons.home", 'Home', 0),
            // _navBarItem("UiKitAssets.icons.clock", 'My visits', 1),
            // _navBarItem("UiKitAssets.icons.doctor", 'New visit', 2),
            // _navBarItem("UiKitAssets.icons.document", 'Documents', 3),
            // _navBarItem("UiKitAssets.icons.pulse", 'Results', 4),
          ],
          // currentIndex: widget.navigationShell.currentIndex,
          currentIndex: 4,
          // onTap: (index) => _onItemTapped(index),
          onTap: (index){},

        ),
      ),
    ),
  );
}