import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:viet_news_flutter/local/NewsLocalizationsDelegate.dart';
import 'package:viet_news_flutter/page/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:viet_news_flutter/redux/NewsState.dart';
import 'page/WebViewPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  /// 创建Store，引用 GSYState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = new Store<NewsState>(
    appReducer,

    ///初始化数据
    initialState: new NewsState(locale: Locale('zh', 'CH')),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: StoreBuilder<NewsState>(builder: (context, store) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.red, platform: TargetPlatform.iOS //滑动返回
              ),
          home: Scaffold(
            body: NewsLocalizations(
              child: SplashPage(),
            ),
          ),
          //国际化
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            NewsLocalizationsDelegate.delegate,
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
        );
      }),
    );
  }
}

class NewsLocalizations extends StatefulWidget {
  final Widget child;

  const NewsLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<NewsLocalizations> createState() => _NewsLocalizations();
}

class _NewsLocalizations extends State<NewsLocalizations> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<NewsState>(builder: (context, store) {
      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
