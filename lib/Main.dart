import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/NewsLocalizationsDelegate.dart';
import 'package:viet_news_flutter/page/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'page/WebViewPage.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
//          brightness: Brightness.light,
//          primaryColor: Colors.red[500],
        primarySwatch: Colors.red,
//          backgroundColor: Colors.white
      ),
      home: Scaffold(
//        backgroundColor: Colors.white,
        body: SplashPage(),
      ),
      //国际化
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        NewsLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}
