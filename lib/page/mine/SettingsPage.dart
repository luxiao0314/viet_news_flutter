import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Widget userIcon = new Container(
      padding: const EdgeInsets.all(left_right_margin),
      color: bg_white,
      child: new Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: top_bottom_middle, bottom: top_bottom_middle),
            child: Text("头像"),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: bg_white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(Local.of(context).personal_info,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SettingsGroup(<Widget>[
            userIcon,
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).magic_num,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).nickname,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).phoneNum,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).password,
              hasDetails: true,
              onPress: () async {},
            ),
          ])
        ],
      ),
    );
  }
}
