import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:write_it_down/SQLHelper.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';

class CreateNote extends StatefulWidget {
  /// PARAMS
  final int noteID;
  final String title, body;
  final bool isNewNote;

  /// CONSTRUCTOR
  const CreateNote(
      {Key? key,
      required this.isNewNote,
      required this.noteID,
      required this.title,
      required this.body})
      : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  /// UI BUILDER
  @override
  Widget build(BuildContext context) {
    /// TEXT CONTROLLERS
    final TextEditingController noteTitleController = TextEditingController();
    final TextEditingController noteBodyController = TextEditingController();

    // populate fields if edit note
    if (!widget.isNewNote) {
      noteTitleController.text = widget.title;
      noteBodyController.text = widget.body;
    }

    /// CREATE NEW NOTE IN DB
    Future<void> insertNote() async {
      if (noteTitleController.text.isEmpty && noteBodyController.text.isEmpty) {
        //title and body both empty, don't save
      }
      //only if either title or body is not empty
      else {
        await SQLHelper.createNote(
            noteTitleController.text, noteBodyController.text);
      }
    }

    /// UPDATE NOTE IN DB
    Future<void> updateNote(int noteID, String title, String body) async {
      if (noteTitleController.text.isEmpty && noteBodyController.text.isEmpty) {
        //title and body both empty, don't update
      }
      //only if either title or body is not empty
      else {
        await SQLHelper.updateNote(
            noteID, noteTitleController.text, noteBodyController.text);
      }
    }

    /// ON BACK CLICK
    void goBack() {
      //if new note, add in db
      if (widget.isNewNote) {
        insertNote();
      }
      //if editing, update in db
      else {
        updateNote(widget.noteID, widget.title, widget.body);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: appBlack,

      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: toolbarHeight,
        centerTitle: true,
        backgroundColor: appBlack,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: goBack,
          child: const Center(
            child: Text(
              "Save",
              style: TextStyle(
                  color: appGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "SFUiDisplay"),
            ),
          ),
        ),
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: toolbarRightIconEndPadding),
              child: Text(
                "Share",
                style: TextStyle(
                    color: hintGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFUiDisplay"),
              ),
            ),
          ),
        ],
        title: SvgPicture.asset('assets/svg/ic_logo_white.svg'),
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  minLines: null,
                  textAlign: TextAlign.start,
                  cursorColor: appBlack,
                  controller: noteTitleController,
                  onChanged: (text) => {},
                  style: const TextStyle(
                      color: appBlack,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontFamily: "playfair"),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Title",
                      hintStyle: TextStyle(color: detailTextGrey)),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    scrollPhysics: const BouncingScrollPhysics(),
                    maxLines: 1000000,
                    // to make it full height
                    controller: noteBodyController,
                    onChanged: (text) => {},
                    textAlign: TextAlign.start,
                    cursorColor: appBlack,
                    style: const TextStyle(
                        color: appBlack,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SFUiDisplay"),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Note",
                        hintStyle: TextStyle(color: detailTextGrey)),
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
