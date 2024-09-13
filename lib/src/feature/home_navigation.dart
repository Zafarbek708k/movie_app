import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedLabelStyle: theme.textTheme.bodyMedium,
          unselectedLabelStyle: theme.textTheme.bodyMedium,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.yellow,
          elevation: 0,
          backgroundColor: widget.navigationShell.currentIndex == 4
              ? Colors.white
              : const Color.fromRGBO(255, 255, 255, 0.64),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home 1"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home 2"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home 3"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home 4"),
            // _navBarItem("UiKitAssets.icons.home", 'Home', 0),
            // _navBarItem("UiKitAssets.icons.clock", 'My visits', 1),
            // _navBarItem("UiKitAssets.icons.doctor", 'New visit', 2),
            // _navBarItem("UiKitAssets.icons.document", 'Documents', 3),
            // _navBarItem("UiKitAssets.icons.pulse", 'Results', 4),
          ],
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (index) => _onItemTapped(index),
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

  // BottomNavigationBarItem _navBarItem(
  //   SvgGenImage icon,
  //   String label,
  //   int index,
  // ) {
  //   return BottomNavigationBarItem(
  //     icon: icon.svg(
  //       colorFilter: ColorFilter.mode(
  //         widget.navigationShell.currentIndex == index
  //             ? AppColors.splashBg
  //             : AppColors.blueGray400,
  //         BlendMode.srcIn,
  //       ),
  //     ),
  //     label: label,
  //   );
  // }
}
