import 'package:flutter/material.dart';
import 'package:tetrix/main.dart';
import 'package:tetrix/panel/controller.dart';
import 'package:tetrix/panel/screen.dart';

class PagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;
   // final screenH = size.height * 0.8;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: <Widget>[
              Flexible(child:
             // Spacer(),
            //  SizedBox(height: size.height * 0.01),
              // The AboutController aligned at the top-right of the column
              Align(
                alignment: Alignment.topRight, // Align to the top-right of the column
               // child: Padding(
                //  padding: const EdgeInsets.all(16.0), // Add padding for positioning
                  child: AboutController(),
               // ),
              ),
              ),
             // AboutController(),
             // Spacer(),
            //  SizedBox(height: size.height * 0.01), // Height based on screen size
              _ScreenDecoration(
                child: Screen(width: screenW),
              ),
            // Spacer(),
             //SizedBox(height: size.height * 0.01), // Add vertical spacing based on screen size
             // DonationButton(),
             //  Flexible(
             //   child:
                BottomActionBar(),
      //  ),
             // Spacer(),
             // SizedBox(height: size.height * 0.01),
             //  Flexible( // Use Flexible to adjust according to screen height
             //    child:
                GameController(),
             // ),
            ],
            // children: <Widget>[
            //   Spacer(),
            //   _ScreenDecoration(child: Screen(width: screenW)),
            //   Spacer(flex: 2),
            //   GameController(),
            // ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          left: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          right: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}
