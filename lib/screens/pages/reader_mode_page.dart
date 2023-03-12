import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';
import 'package:write_it_down/screens/read_note_screen.dart';
import 'package:write_it_down/widgets/note_item.dart';

class ReaderModePage extends StatefulWidget {
  const ReaderModePage({Key? key}) : super(key: key);

  @override
  State<ReaderModePage> createState() => _ReaderModePageState();
}

/// CONSTRUCTOR
class _ReaderModePageState extends State<ReaderModePage> {
  final List notesList = [
    const NoteItem(
        date: "02 April, 2019",
        title: "Song for the Old Ones",
        numberOfPages: 4),
    const NoteItem(
        date: "02 October, 2017", title: "Phenomenal Woman", numberOfPages: 6),
    const NoteItem(
        date: "19 March, 2019", title: "Awaking in New York", numberOfPages: 1),
    const NoteItem(
        date: "03 August, 2018",
        title: "The Heart of a Woman ",
        numberOfPages: 3),
    const NoteItem(
        date: "21 June, 2017",
        title: "The Mothering Blackness",
        numberOfPages: 1),
    const NoteItem(
        date: "12 June, 2017", title: "Mom & Me & Mom", numberOfPages: 2),
    const NoteItem(
        date: "02 April, 2019",
        title: "Song for the Old Ones",
        numberOfPages: 4),
    const NoteItem(
        date: "02 October, 2017", title: "Phenomenal Woman", numberOfPages: 6),
    const NoteItem(
        date: "19 March, 2019", title: "Awaking in New York", numberOfPages: 1),
    const NoteItem(
        date: "03 August, 2018",
        title: "The Heart of a Woman ",
        numberOfPages: 3),
    const NoteItem(
        date: "21 June, 2017",
        title: "The Mothering Blackness",
        numberOfPages: 1),
    const NoteItem(
        date: "12 June, 2017", title: "Mom & Me & Mom", numberOfPages: 2),
  ];

  /// ON GRID ITEM CLICKED
  void onItemClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReadNote(),
      ),
    );

    // THIS IS TO POP ALL AND GO TO NEW DESTINATION
    // LEFT HERE FOR REF
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (BuildContext context) => const CreateNote()));
  }

  /// UI BUILDER
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appPadding),
        child: Expanded(
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
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(0.0),
                  itemCount: notesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: onItemClicked, // custom item click
                      child: notesList[index], // item list
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
