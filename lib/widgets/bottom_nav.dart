import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';

class BottomNav extends StatelessWidget {
  //params
  final onTap;
  final int selectedPage;

  const BottomNav({
    Key? key,
    required this.onTap,
    required this.selectedPage,
  }) : super(key: key);

  //image assets
  final documentImageAsset = const AssetImage('images/ic_folder.png');
  final documentImageAssetDisabled =
      const AssetImage('images/ic_folder_disabled.png');
  final readerModeImageAsset = const AssetImage('images/ic_reader.png');
  final readerModeImageAssetDisabled =
      const AssetImage('images/ic_reader_disabled.png');
  final settingsImageAsset = const AssetImage('images/ic_settings.png');
  final settingsImageAssetDisabled =
      const AssetImage('images/ic_settings_disabled.png');

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedPage,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: bottomNavBgBlack,
      selectedItemColor: Colors.white,
      unselectedItemColor: disabledGrey,
      elevation: 5,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: documentImageAsset),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: documentImageAssetDisabled),
            ),
            label: "Documents"),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: readerModeImageAsset),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: readerModeImageAssetDisabled),
            ),
            label: "Reader Mode"),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: settingsImageAsset),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: settingsImageAssetDisabled),
            ),
            label: "Settings"),
      ],
    );
  }
}
