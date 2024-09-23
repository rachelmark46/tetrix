import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';


class AlertAbout extends StatelessWidget {
  static const String authorURL = "https://github.com/rachelmark46";
  static const String releasesURL =
      "https://github.com/rachelmark46/tetrix";
  static const String sourceURL =
      "https://github.com/rachelmark46/tetrix";
  static const String licenseURL =
      "https://github.com/rachelmark46/sudoku/blob/releaseV1.0.0/LICENSE";

  const AlertAbout({Key? key}) : super(key: key);

  openURL(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/icon/icon_round.png',
              //   height: 48.0, width: 48.0, fit: BoxFit.contain),
              Text(
                '   Sudoku',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Version: ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'roboto',
                    fontSize: 17),
              ),
              InkWell(
                onTap: () => openURL(releasesURL),
                child: Text(
                  '${MyApp.versionNumber} ',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'roboto',
                      fontSize: 17),
                ),
              ),

            ],
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Author: ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'roboto',
                    fontSize: 17),
              ),
              InkWell(
                onTap: () => openURL(authorURL),
                child: Text(
                  'PUZZLE PIXEL STUDIO',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'roboto',
                      fontSize: 17),
                ),
              )
            ],
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'License: ',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'roboto',
                    fontSize: 17),
              ),
              InkWell(
                onTap: () => openURL(licenseURL),
                child: Text(
                  'GNU GPLv3',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'roboto',
                      fontSize: 17),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => openURL(sourceURL),
                child: Text(
                  'Source Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'roboto',
                      fontSize: 17),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
