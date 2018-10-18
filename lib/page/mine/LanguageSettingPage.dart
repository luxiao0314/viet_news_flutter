import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';

class LanguageSettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageSettingPage();
}

class _LanguageSettingPage extends State<LanguageSettingPage> {
  @override
  Widget build(BuildContext context) {
    Widget auto = Container(
      padding: const EdgeInsets.only(
          left: left_right_margin),
      color: bg_white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: top_bottom_small, bottom: top_bottom_small),
                child: Text(Local.of(context).auto, style: text_style_16_black),
              )),
          Container(
              padding: EdgeInsets.only(left: 5.0, right: arrow_margin_right),
              child: Icon(
                CupertinoIcons.check_mark,
                color: mediumGrayColor,
                size: 21.0,
              )),
        ],
      ),
    );

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
          auto,
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          auto,
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          auto
        ],
      ),
    );
  }


}
