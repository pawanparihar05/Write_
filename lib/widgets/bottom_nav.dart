import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';
import 'package:write_it_down/constants/strings.dart';

class BottomNav extends StatelessWidget {
  //params
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  final int selectedPage;

  const BottomNav({
    Key? key,
    required this.onTap,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedPage,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: bottomNavBgBlack,
      selectedItemColor: appGreen,
      unselectedItemColor: disabledGrey,
      elevation: 5,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.note_add_rounded,
                color: appGreen,
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.note_add_rounded,
                color: disabledGrey,
              ),
            ),
            label: notes),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.chrome_reader_mode_rounded,
                color: appGreen,
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.chrome_reader_mode_rounded,
                color: disabledGrey,
              ),
            ),
            label: readerMode),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.settings_rounded,
                color: appGreen,
              ),
            ),
            icon: Padding(
              padding: EdgeInsets.all(bottomNavItemPadding),
              child: Icon(
                Icons.settings_rounded,
                color: disabledGrey,
              ),
            ),
            label: settings),
      ],
    );
  }
}
