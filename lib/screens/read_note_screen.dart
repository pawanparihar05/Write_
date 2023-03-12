import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';
import 'package:write_it_down/constants/strings.dart';

class ReadNote extends StatefulWidget {
  const ReadNote({Key? key}) : super(key: key);

  @override
  State<ReadNote> createState() => _ReadNoteState();
}

class _ReadNoteState extends State<ReadNote> {
  /// ON BACK CLICK
  void goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cardBgWhite,
        leading: GestureDetector(
          onTap: goBack,
          child: const Padding(
            padding: EdgeInsets.all(appPadding),
            child: Icon(
              Icons.arrow_back_ios,
              color: detailTextGrey,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(appPadding),
            child: Icon(
              Icons.ios_share_rounded,
              color: detailTextGrey,
            ),
          ),
        ],
        title: const Center(
          child: Image(
            image: AssetImage('images/ic_logo_grey.png'),
            width: 80,
          ),
        ),
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Song for the Old Ones",
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: appBlack,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: "playfair"),
            ),
            const SizedBox(height: 5),
            const Text(
              "by Maya Angelou",
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: appBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "playfair"),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,

              /// FADING EDGE TOP & BOTTOM
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    stops: [
                      0.0,
                      // top cut amount (higher = more cut from top)
                      0.0,
                      // top fade amount (higher = more faded area from top)
                      0.6,
                      // bottom fade amount(higher = less faded area from top)
                      1.0
                      // bottom cut amount (higher = less cut from top)
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,

                /// SCROLL VIEW WITH TEXT
                child: const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical, //.horizontal
                  child: Text(
                    testString,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: appBlack,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SFUiDisplay"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}