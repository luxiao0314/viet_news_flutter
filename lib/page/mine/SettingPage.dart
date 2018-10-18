import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/manager/CusToast.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
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
            padding: EdgeInsets.only(top: module_margin),
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
          ]),
          Container(
            height: 50.00,
            width: 400.00,
            margin: EdgeInsets.only(
                top: 20.0, left: left_right_margin, right: left_right_margin),
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.red[500],
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
              onPressed: () => CusToast.toast(context, Local.of(context).logout),
              minSize: 13.0,
              child: Text(
                Local.of(context).logout,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
