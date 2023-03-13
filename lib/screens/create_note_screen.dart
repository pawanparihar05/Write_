import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  /// ON BACK CLICK
  void goBack() {
    Navigator.pop(context);
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
        backgroundColor: appBlack,
        leadingWidth: toolbarLeftIconStartPadding,
        leading: GestureDetector(
          onTap: goBack,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: toolbarRightIconEndPadding),
            child: Icon(
              Icons.save_rounded,
              color: appGreen,
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
              children: const [
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  minLines: null,
                  textAlign: TextAlign.start,
                  cursorColor: appBlack,
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      fontFamily: "playfair"),
                  decoration: InputDecoration(
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
                    scrollPhysics: BouncingScrollPhysics(),
                    maxLines: 1000000,
                    textAlign: TextAlign.start,
                    cursorColor: appBlack,
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SFUiDisplay"),
                    decoration: InputDecoration(
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
