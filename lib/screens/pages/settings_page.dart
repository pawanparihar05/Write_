
import 'package:flutter/material.dart';
import 'package:write_it_down/constants/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// APP VERSION
          Row(
            children: [
              const Icon(
                Icons.build_circle,
                size: 30,
                color: appGreen,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "App version",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "1.0.0-practice-flutter",
                    style: TextStyle(color: hintGrey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          /// DEVELOPER
          Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                size: 30,
                color: appGreen,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Developed By",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Pawan Parihar",
                    style: TextStyle(color: hintGrey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          /// GITHUB
          Row(
            children: [
              const Icon(
                Icons.adb,
                size: 30,
                color: appGreen,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "GitHub",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "@pawanparihar05",
                    style: TextStyle(color: hintGrey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          /// EMAIL
          Row(
            children: [
              const Icon(
                Icons.email_rounded,
                size: 30,
                color: appGreen,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Contact Me",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "pawanparihar05@gmail.com",
                    style: TextStyle(color: hintGrey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
