import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';
import 'package:viet_news_flutter/view/SelectItem.dart';

class LanguageSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageSettingPage();
}

class _LanguageSettingPage extends State<LanguageSettingPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          SelectItem(
            label: Local.of(context).auto,
            isSelected: true,
            onPress: () async {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          SelectItem(
            label: Local.of(context).chinese,
            isSelected: false,
            onPress: () async {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          SelectItem(
            label: Local.of(context).english,
            isSelected: false,
            onPress: () async {},
          ),
        ],
      ),
    );
  }
}
