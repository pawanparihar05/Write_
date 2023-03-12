import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:write_it_down/constants/colors.dart';

import 'package:write_it_down/constants/dimens.dart';

class AddNoteItem extends StatelessWidget {
  const AddNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardGrey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/ic_plus.svg'),
        ],
      ),
    );
  }
}
