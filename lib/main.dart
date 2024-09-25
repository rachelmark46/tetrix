import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tetrix/gamer/gamer.dart';
import 'package:tetrix/material/audios.dart';
import 'package:tetrix/panel/about.dart';
import 'package:tetrix/panel/page_portrait.dart';
import 'package:tetrix/splash_screen_page.dart';
import 'gamer/keyboard.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';

void main() => runApp(MyApp());

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const String versionNumber = '2.4.1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TETRIS',
      // localizationsDelegates: [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      navigatorObservers: [routeObserver],
      //supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
      // home: Scaffold(
      //   body: Sound(child: Game(child: KeyboardController(child: _HomePage()))),
      //),
    );
  }
}

const SCREEN_BORDER_WIDTH = 3.0;

const BACKGROUND_COLOR = const Color(0xffefcc19);

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    // return land ? PageLand() : PagePortrait();
    return Scaffold(
        body: Stack(children: [


      Sound(
          child: Game(
              child: KeyboardController(
                  child: land ? PageLand() : PagePortrait()))),
     // SizedBox(height: 10),
     //  Positioned(
     //    top: 15.0,
     //    right: 15.0,
     //    child: FloatingActionButton(
     //      onPressed: () {
     //        showDialog(
     //          context: context,
     //          builder: (BuildContext context) {
     //            return AlertAbout(); // Show the AlertAbout widget
     //          },
     //        );
     //      },
     //      mini: true,
     //      backgroundColor: Colors.red,
     //      child: const Icon(Icons.info_outline_rounded),
     //    ),
     //  ),

      // ],
      //   )
      // buy me a coffee
      // children :
    ]));
  }
}
