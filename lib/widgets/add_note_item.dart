
import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';

import '../constants/dimens.dart';

class AddNoteItem extends StatelessWidget {
  const AddNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage("images/ic_add_grey.png"),
            height: 50,
          )
        ],
      ),
    );
  }
}
