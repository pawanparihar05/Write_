import 'dart:async';

import 'package:flutter/material.dart';
import 'package:write_it_down/SQLHelper.dart';
import 'package:write_it_down/Utils.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dbConstants.dart';
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
  List<Map<String, dynamic>> fetchedNotesList = [];

  /// APP INIT STATE (onCreate)
  @override
  void initState() {
    super.initState();
    //fetch notes from db
    fetchNotes();
  }

  /// ON COMING BACK TO PAGE (onResume)
  FutureOr onComingBack(dynamic value) {
    //refresh data
    fetchNotes();
    //set state
    setState(() {});
  }

  /// NAVIGATES TO GIVEN ROUTE AND HANDLES onResume for the screen
  void navigateWithResumeHandle(Route route) {
    // go to create note screen, handle on coming back as well
    Navigator.push(context, route).then(onComingBack);
  }

  /// FETCH ALL NOTES FROM DB
  fetchNotes() async {
    final data = await SQLHelper.getAllNotes();
    setState(() {
      fetchedNotesList = data;
    });
  }

  /// OPEN NOTE CLICK
  void goToNoteReaderMode(String title, String body, String createdAt) {
    // route to create note screen
    Route route = MaterialPageRoute(
      builder: (context) => ReadNote(
        title: title,
        body: body,
        createdAt: createdAt,
      ),
    );

    //navigate
    navigateWithResumeHandle(route);

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
              // TextField(
              //   textAlign: TextAlign.center,
              //   cursorColor: Colors.white,
              //   style: const TextStyle(
              //       color: Colors.white,
              //       fontFamily: 'SfUiDisplay',
              //       fontWeight: FontWeight.bold),
              //   decoration: InputDecoration(
              //       filled: true,
              //       fillColor: cardGrey,
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(borderRadius)),
              //       hintText: "Search",
              //       hintStyle: const TextStyle(color: hintGrey)),
              // ),
              // const SizedBox(height: 15),

              /// CARD GRID
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  itemCount: fetchedNotesList.length,
                  // to make room for AddNote()
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final Map<String, dynamic> notesList =
                        fetchedNotesList[index];
                    return GestureDetector(
                      onTap: () {
                        //edit note click
                        goToNoteReaderMode(
                          notesList[fieldNoteTitle],
                          notesList[fieldNoteBody],
                          Utils.convertTimeFormat(
                              notesList[fieldNoteCreatedAt]),
                        );
                      },
                      child: NoteItem(
                        date: Utils.convertTimeFormat(
                            notesList[fieldNoteCreatedAt]),
                        title: notesList[fieldNoteTitle],
                        numberOfPages: 1,
                      ),
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
