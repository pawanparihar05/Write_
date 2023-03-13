import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';
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
  ///PAGES LIST FOR BOTTOM NAV
  List pages = [
    const DocumentPage(),
    const ReaderModePage(),
    const SettingsPage(),
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
          elevation: 0,
          toolbarHeight: toolbarHeight,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: SvgPicture.asset('assets/svg/ic_logo_white.svg'),
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
