import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class EditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditPage();
}

class _EditPage extends State<EditPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    //用户头像
    Widget userIcon = new Container(
      padding: const EdgeInsets.only(
          left: left_right_margin,
          top: left_right_margin,
          bottom: left_right_margin),
      color: bg_white,
      child: new Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
                top: top_bottom_middle, bottom: top_bottom_middle),
            child: Text(Local.of(context).avatar, style: text_style_16_black),
          )),
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              padding: EdgeInsets.only(right: 5.0),
              child: Image.asset("images/ic_default_article.png",
                  width: icon_user, height: icon_user, fit: BoxFit.cover),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 5.0, right: arrow_margin_right),
              child: Icon(
                CupertinoIcons.forward,
                color: mediumGrayColor,
                size: 21.0,
              )),
        ],
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
        title: Text(Local.of(context).personal_info,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: elevation_low,
      ),
      body: Column(
        children: <Widget>[
          userIcon,
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          SettingsGroup(<Widget>[
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).magic_num,
              value: "A123456",
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).nickname,
              value: "今晚打老虎",
              hasDetails: true,
              onPress: () async {},
            )
          ]),
          Container(
            padding: EdgeInsets.only(top: module_margin),
          ),
          SettingsGroup(<Widget>[
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).phoneNum,
              value: "已绑定",
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).password,
              value: "已设置",
              hasDetails: true,
              onPress: () async {},
            ),
          ])
        ],
      ),
    );
  }
}
