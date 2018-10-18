import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
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
        title: Text(Local.of(context).settings,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          SettingsGroup(<Widget>[
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).clearCache,
              hasDetails: false,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).language_setting,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).help,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).feed_back,
              hasDetails: true,
              onPress: () async {},
            ),
          ]),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          SettingsGroup(<Widget>[
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).about,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).version,
              hasDetails: true,
              onPress: () async {},
            ),
          ])
        ],
      ),
    );
  }
}
