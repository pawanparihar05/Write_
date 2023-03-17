import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:write_it_down/constants/colors.dart';
import 'package:write_it_down/constants/dimens.dart';

class ReadNote extends StatefulWidget {
  /// PARAMS
  final String title, body, createdAt;

  /// CONSTRUCTOR
  const ReadNote(
      {Key? key,
      required this.title,
      required this.body,
      required this.createdAt})
      : super(key: key);

  @override
  State<ReadNote> createState() => _ReadNoteState();
}

class _ReadNoteState extends State<ReadNote> {
  @override
  Widget build(BuildContext context) {

    /// ON BACK CLICK
    void goBack() {
      Navigator.pop(context);
    }

    /// UI BUILDER
    return Scaffold(
      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: toolbarHeight,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leadingWidth: 40,
        leading: GestureDetector(
          onTap: goBack,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: detailTextGrey,
          ),
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(right: toolbarRightIconEndPadding),
        //     child: Icon(
        //       Icons.ios_share_rounded,
        //       color: detailTextGrey,
        //     ),
        //   ),
        // ],
        title: SvgPicture.asset('assets/svg/ic_logo_grey.svg'),
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(height: 10),
            Text(
              widget.title,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: appBlack,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: "playfair"),
            ),
            const SizedBox(height: 5),
            Text(
              widget.createdAt,
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: detailTextGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "playfair"),
            ),
            const SizedBox(height: 10),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical, //.horizontal
                  child: Text(
                    widget.body,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
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
