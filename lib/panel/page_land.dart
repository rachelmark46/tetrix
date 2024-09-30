import 'package:flutter/material.dart';
import 'package:tetrix/main.dart';
import 'package:tetrix/panel/controller.dart';
import 'package:tetrix/panel/screen.dart';

class PageLand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height - MediaQuery.of(context).viewInsets.vertical;
    var width = size.width;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to the top
          children: <Widget>[
            // Left-side column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: height * 0.1), // Adjust the top space as needed
                SystemButtonGroup(),
                SizedBox(height: height * 0.05), // Space after button group
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05, // 5% of screen width for left padding
                    bottom: height * 0.05, // 5% of screen height for bottom padding
                  ),
                  child: DropButton(),
                ),
              ],
            ),
            // Screen decoration
            _ScreenDecoration(child: Screen.fromHeight(width * 0.4)),
            // Right-side column with controls
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * 0.01),
                Align(
                  alignment: Alignment.topRight,
                  child: AboutController(),
                ),
                SizedBox(height: height * 0.01), // Spacing for visibility
                DirectionController(), // Ensure this is visible
                SizedBox(height: height * 0.01),
                BottomActionBar(),
                SizedBox(height: height * 0.05), // Extra space at the bottom
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// _ScreenDecoration remains the same as your previous code
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
          top: BorderSide(color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          left: BorderSide(color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          right: BorderSide(color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
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
