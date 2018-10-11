import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/splash.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
//      theme: ThemeData(
////          brightness: Brightness.light,
////          primaryColor: Colors.red[500],
//        primarySwatch: Colors.red,
////          backgroundColor: Colors.white
//      ),
      home: Scaffold(
//        backgroundColor: Colors.white,
        body: SplashPage(),
      ),
    );
  }
}
