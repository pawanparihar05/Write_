import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';

class NoteItem extends StatelessWidget {
  /// PARAMS
  final String date, title;
  final int numberOfPages;

  /// CONSTRUCTOR
  const NoteItem(
      {Key? key,
      required this.date,
      required this.title,
      required this.numberOfPages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBgWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: detailTextGrey,
                fontSize: 14,
                fontFamily: "SfUiDisplay",
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: appBlack,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: "playfair"),
            ),
            Text(
              "$numberOfPages Pages",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: detailTextGrey,
                fontSize: 14,
                fontFamily: "SfUiDisplay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
