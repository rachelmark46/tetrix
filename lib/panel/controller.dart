import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/donationButtons/buyMeACoffeeButton.dart';
import 'package:tetrix/gamer/gamer.dart';
import 'package:tetrix/panel/check_app.dart';
import 'package:tetrix/panel/payment.dart';

import 'about.dart';


// class GameController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Row(
//         children: <Widget>[
//           Expanded(child:
//           LeftController()),
//           Expanded(child: DirectionController()),
//         ],
//       ),
//     );
//   }
// }

class GameController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get device height
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: deviceHeight * 0.3, // Set height relative to device height (30% of device height)
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: LeftController(),
          ),
          Flexible(
            flex: 1,
            child: DirectionController(),
          ),
        ],
      ),
    );
  }
}

const Size _DIRECTION_BUTTON_SIZE = const Size(45, 45);

const Size _SYSTEM_BUTTON_SIZE = const Size(22, 22);

const double _DIRECTION_SPACE = 16;

const double _iconSize = 16;

class DirectionController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox.fromSize(size: _DIRECTION_BUTTON_SIZE * 2.8),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: _iconSize,
                        )),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_right,
                          size: _iconSize,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_left,
                          size: _iconSize,
                        )),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: _iconSize,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: math.pi / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                      enableLongPress: false,
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).rotate();
                      }),
                  SizedBox(width: _DIRECTION_SPACE),
                  _Button(
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).right();
                      }),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _Button(
                      size: _DIRECTION_BUTTON_SIZE,
                      onTap: () {
                        Game.of(context).left();
                      }),
                  SizedBox(width: _DIRECTION_SPACE),
                  _Button(
                    size: _DIRECTION_BUTTON_SIZE,
                    onTap: () {
                      Game.of(context).down();
                    },
                  ),
                ],
              ),
              SizedBox(height: _DIRECTION_SPACE),
            ],
          ),
        ),
      ],
    );
  }
}

class SystemButtonGroup extends StatelessWidget {
  static const _systemButtonColor = const Color(0xFF2dc421);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _Description(
          //text: S.of(context).sounds,
          text: 'SOUND ',
          child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              color: _systemButtonColor,
              enableLongPress: false,
              onTap: () {
                Game.of(context).soundSwitch();
              }),
        ),
        _Description(
          //text: S.of(context).pause_resume,
          text: 'PAUSE/RESUME',
          child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              color: _systemButtonColor,
              enableLongPress: false,
              onTap: () {
                Game.of(context).pauseOrResume();
              }),
        ),
        _Description(
          //text: S.of(context).reset,
          text: ' RESET',
          child: _Button(
              size: _SYSTEM_BUTTON_SIZE,
              enableLongPress: false,
              color: Colors.redAccent,
              onTap: () {
                Game.of(context).reset();
              }),
        )
      ],
    );
  }
}

class DropButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Description(
      text: 'DROP',
      child: _Button(
        enableLongPress: false,
        size: Size(80, 80),
        onTap: () {
          Game.of(context).drop();
        },
      ),
      textStyle: TextStyle(
        fontSize: 24, // Increase text size
        fontWeight: FontWeight.bold, // Make the text bold
        color: Colors.black, // You can customize the color if needed
      ),
    );
  }
}

class BottomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    //return Align(
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
      //  padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        padding: const EdgeInsets.only(bottom: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                 Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BuyMeACoffeeButton(
                      buyMeACoffeeName: "rachelmark",
                      color: BuyMeACoffeeColor.Blue,
                      //Allows custom styling

                    )
                  ],
                ),
            SizedBox(height: screenHeight * 0.01),
            //const SizedBox(height : 20),


            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.cyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ImageGrid();
                    },
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Text(
                      'CHECK OTHER APPS',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class LeftController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SystemButtonGroup(),
       // Expanded(

         // child:
          Center(
            child: DropButton(),
          ),
      //  )
      ],
    );
  }
}

//
// class AboutController extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      return
//     //   Container(
//     //   height :16,
//     //  width :16,
//      //child:
//       Positioned(
//         top: 14.0,
//         right: 14.0,
//         child: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertAbout(); // Show the AlertAbout widget
//               },
//             );
//           },
//           mini: true,
//           backgroundColor: Colors.red,
//           child: const Icon(Icons.info_outline_rounded),
//        // ),
//       ),
//     );
//   }
// }

class AboutController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 14.0,
          right: 14.0,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertAbout(); // Show the AlertAbout widget
                },
              );
            },
            mini: true,
            backgroundColor: Colors.red,
            child: const Icon(Icons.info_outline_rounded),
          ),
        ),
      ],
    );
  }
}


class _Button extends StatefulWidget {
  final Size size;
  final Widget? icon;

  final VoidCallback onTap;

  ///the color of button
  final Color color;

  final bool enableLongPress;

  const _Button({
    Key? key,
    required this.size,
    required this.onTap,
    this.icon,
    this.color = Colors.blue,
    this.enableLongPress = true,
  }) : super(key: key);

  @override
  _ButtonState createState() {
    return new _ButtonState();
  }
}

///show a hint text for child widget
class _Description extends StatelessWidget {
  final String text;

  final Widget child;

  final AxisDirection direction;
  final TextStyle? textStyle; // Add a textStyle parameter

  const _Description({
    Key? key,
    required this.text,
    this.direction = AxisDirection.down,
    required this.child,
    this.textStyle, // Accept the textStyle parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (direction) {
      case AxisDirection.right:
        widget = Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          child,
          SizedBox(width: 8),
          Text(text, style: textStyle)
        ]);
        break;
      case AxisDirection.left:
        widget = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              style: textStyle,
            ),
            SizedBox(width: 8),
            child
          ],
          //mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.up:
        widget = Column(
          children: <Widget>[
            Text(text, style: textStyle),
            SizedBox(height: 8),
            child
          ],
          mainAxisSize: MainAxisSize.min,
        );
        break;
      case AxisDirection.down:
        widget = Column(
          children: <Widget>[
            child,
            SizedBox(height: 8),
            Text(
              text,
              style: textStyle,
            )
          ],
          mainAxisSize: MainAxisSize.min,
        );
        break;
    }
    return DefaultTextStyle(
      child: widget,
      style: textStyle ??
          TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class _ButtonState extends State<_Button> {
  Timer? _timer;

  bool _tapEnded = false;

  late Color _color;

  @override
  void didUpdateWidget(_Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
