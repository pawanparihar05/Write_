import 'dart:async';

import 'package:flutter/material.dart';
import 'package:write_it_down/screens/home_screen.dart';
import '../constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String logoWhite = 'assets/ic_logo_white.svg';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // timer to hold splash for some time
    // and navigate to HomeScreen()
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen())));

    // get splash image asset
    // not using same as the flutter_native_splash lib
    // because there 4X image is required and cant change
    // the size manually, here we can use normal size and
    // if needed we can use height to adjust
    var assetsImage = const AssetImage('images/ic_logo_white.png');
    //create image widget from image asset
    var splashImage = Image(image: assetsImage);

    // ui setup
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: appBlack),
          child: Center(
            child: splashImage,
          ),
        ),
      ),
    );
  }
}
