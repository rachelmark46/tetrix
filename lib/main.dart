import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tetrix/gamer/gamer.dart';
import 'package:tetrix/material/audios.dart';
import 'package:tetrix/panel/page_portrait.dart';
import 'package:tetrix/splash_screen_page.dart';
import 'gamer/keyboard.dart';

void main() => runApp(MyApp());



final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home:  SplashScreenPage(),
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
      body: Sound(child: Game(child: KeyboardController(child: land ? PageLand() : PagePortrait()))),
    );
  }
}

