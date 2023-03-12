import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/widgets/add_note_item.dart';
import '../constants/dimens.dart';
import '../widgets/note_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,

      ///APP BAR
      appBar: AppBar(
        backgroundColor: appBlack,
        title: const Image(
          image: AssetImage('images/ic_logo.png'),
          width: 100,
        ),
      ),

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
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
      ),

      /// BODY
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                /// SEARCH FIELD
                TextField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SfUiDisplay',
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: cardGrey,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(borderRadius)),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: hintGrey)),
                ),

                /// CARD GRID
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(0.0),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    children: const [
                      AddNoteItem(),
                      NoteItem(
                          date: "02 April, 2019",
                          title: "Song for the Old Ones",
                          numberOfPages: 4),
                      NoteItem(
                          date: "19 March, 2019",
                          title: "Awaking in New York",
                          numberOfPages: 1),
                      NoteItem(
                          date: "03 August, 2018",
                          title: "The Heart of a Woman ",
                          numberOfPages: 3),
                      NoteItem(
                          date: "21 June, 2017",
                          title: "The Mothering Blackness",
                          numberOfPages: 1),
                      NoteItem(
                          date: "12 June, 2017",
                          title: "Mom & Me & Mom",
                          numberOfPages: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
