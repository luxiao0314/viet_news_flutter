import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/redux/LocalRedux.dart';
import 'package:viet_news_flutter/redux/NewsState.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/view/SelectItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageSettingPage();
}

class _LanguageSettingPage extends State<LanguageSettingPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> type = [
      Local.of(context).auto,
      Local.of(context).chinese,
      Local.of(context).english
    ];
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(Local.of(context).language_setting,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: 0.0,
      ),
      body: StoreBuilder<NewsState>(
        builder: (context, store) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return SelectItem(
                label: type[index],
                isSelected: true,
                onPress: () async {
                  changeLocale(store, index);
                  Navigator.pop(context);
                },
              );
            },
            itemCount: 3,
          );
        },
      ),
    );
  }

  ///切换语言
  static changeLocale(Store<NewsState> store, int index) {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 0:
      case 1:
        locale = Locale('zh', 'CH');
        break;
      case 2:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }
}
