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
  List<Map<String, dynamic>> _notesList = [];

  /// APP INIT STATE (onCreate)
  @override
  void initState() {
    super.initState();
    //fetch notes from db
    fetchNotes();
  }

  /// FETCH ALL NOTES FROM DB
  void fetchNotes() async {
    final data = await SQLHelper.getAllNotes();
    setState(() {
      _notesList = data;
    });
  }

  /// ON GRID ITEM CLICKED
  void onItemClicked(bool isNewNote, int noteIndex) {
    // new note
    if (isNewNote) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateNote(
            isNewNote: false,
            title: "",
            body: "",
          ),
        ),
      );
    }
    //go to edit note with note item
    else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNote(
            isNewNote: false,
            title: _notesList[noteIndex][fieldNoteTitle],
            body: _notesList[noteIndex][fieldNoteBody],
          ),
        ),
      );
    }
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

              ///todo temp remove and put properly
              GestureDetector(
                  onTap: () {
                    onItemClicked(true, 0);
                  }, // custom item click
                  child: const AddNoteItem()),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  itemCount: _notesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        onItemClicked(false, index);
                      }, // custom item click
                      child: NoteItem(
                        date: _notesList[index][fieldNoteCreatedAt],
                        title: _notesList[index][fieldNoteTitle],
                        numberOfPages: 1,
                      ), // item list
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
