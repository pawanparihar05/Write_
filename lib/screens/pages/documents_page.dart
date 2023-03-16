import 'dart:async';

import 'package:flutter/material.dart';
import 'package:write_it_down/SQLHelper.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dbConstants.dart';
import 'package:write_it_down/constants/dimens.dart';
import 'package:write_it_down/screens/create_note_screen.dart';
import 'package:write_it_down/widgets/add_note_item.dart';
import 'package:write_it_down/widgets/note_item.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

/// CONSTRUCTOR
class _DocumentPageState extends State<DocumentPage> {
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

  /// ADD NOTE CLICK
  void handleAddNote() {
    // route to create note screen
    Route route = MaterialPageRoute(
      builder: (context) => const CreateNote(
        isNewNote: true,
        title: "",
        body: "",
        noteID: 0,
      ),
    );

    //navigate
    navigateWithResumeHandle(route);
  }

  /// EDIT NOTE CLICK
  void handleEditNote(int noteID, String title, String body) {
    // route to edit note screen
    Route route = MaterialPageRoute(
      builder: (context) => CreateNote(
        isNewNote: false,
        noteID: noteID,
        title: title,
        body: body,
      ),
    );

    //navigate
    navigateWithResumeHandle(route);
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
                  itemCount: fetchedNotesList.length + 1,
                  // to make room for AddNote()
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // add first item as AddNoteItem()
                    if (index == 0) {
                      return GestureDetector(
                          //on new note click
                          onTap: () {
                            handleAddNote();
                          },
                          child: const AddNoteItem());
                    }
                    //correct the notes list
                    final Map<String, dynamic> correctedIndexNote =
                        fetchedNotesList[index - 1];
                    return GestureDetector(
                      onTap: () {
                        //edit note click
                        handleEditNote(
                            correctedIndexNote[fieldNoteID],
                            correctedIndexNote[fieldNoteTitle],
                            correctedIndexNote[fieldNoteBody]);
                      },
                      child: NoteItem(
                        date: correctedIndexNote[fieldNoteCreatedAt],
                        title: correctedIndexNote[fieldNoteTitle],
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
