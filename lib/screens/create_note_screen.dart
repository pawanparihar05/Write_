import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Scaffold(
        backgroundColor: appBlack,

        /// APP BAR
        appBar: AppBar(
          backgroundColor: appBlack,
          leading: GestureDetector(
            onTap: goBack,
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: cardBgWhite,
              ),
            ),
          ),
          actions: const [
            Center(
                child: Icon(
              Icons.save,
              color: appGreen,
            )),
          ],
          title: const Image(
            image: AssetImage('images/ic_logo_white.png'),
            width: 100,
          ),
        ),
      ),
    );
  }
}
