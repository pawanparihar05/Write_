import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/screens/pages/documents_page.dart';
import 'package:write_it_down/screens/pages/reader_mode_page.dart';
import 'package:write_it_down/screens/pages/settings_page.dart';
import 'package:write_it_down/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //image assets
  var documentImageAsset = const AssetImage('images/ic_folder.png');
  var documentImageAssetDisabled =
      const AssetImage('images/ic_folder_disabled.png');
  var readerModeImageAsset = const AssetImage('images/ic_reader.png');
  var readerModeImageAssetDisabled =
      const AssetImage('images/ic_reader_disabled.png');
  var settingsImageAsset = const AssetImage('images/ic_settings.png');
  var settingsImageAssetDisabled =
      const AssetImage('images/ic_settings_disabled.png');

  ///PAGES LIST FOR BOTTOM NAV
  List pages = [
    DocumentPage(),
    ReaderModePage(),
    SettingsPage(),
  ];

  int selectedPage = 0;

  void onTap(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBlack,

        /// APP BAR
        appBar: AppBar(
          backgroundColor: appBlack,
          title: Center(
            child: const Image(
              image: AssetImage('images/ic_logo_white.png'),
              width: 80,
            ),
          ),
        ),

        /// BODY BASED ON BOTTOM NAV
        body: pages[selectedPage],

        /// BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNav(
          onTap: onTap,
          selectedPage: selectedPage,
        ));
  }
}
