import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';
import 'package:viet_news_flutter/util/tools.dart' as Method;
import 'package:viet_news_flutter/view/ContentListView.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({this.author});
  ContentListResponseAuthor author;
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  static const platform = const MethodChannel(Method.methodChannelName);
  double _statusBarHeight = 0.0;
  ContentListResponse contentListResponse;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getStatusBarHeight.then((result) {
      if (result != 0) {
        setState(() {
          _statusBarHeight = result;
          Method.print2("_statusBarHeight", _statusBarHeight);
          _requestGetUserInfo();
          _requestGetUserArticle();
        });
      }
    });
  }

  /// 获取用户信息
  Future<void> _requestGetUserInfo() async {
    Method.print2("aaaaa", "打印");
    final response = await Fetch.init.get(ApiService.userInfo + "${widget.author.id}");
    final author = ContentListResponseAuthor.fromJson(response);
    Method.print2("author", author.toString());
    widget.author = author;
    setState(() {
    });
  }

  /// 获取该用户发表的文章
  Future<void> _requestGetUserArticle() async {
    final response = await Fetch.init.post(ApiService.contentListForUser);
    contentListResponse = ContentListResponse(response);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _renderHeaderView(context)),
    );
  }

  // navigationBar
  Widget _renderHeaderView(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          height: 236.0 + 16.0,
          child: Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(
                    height: 213.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.author.avatar),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6),
                          BlendMode.colorBurn
                        )
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        // 导航条
                        _renderNavigationBar(),
                        // 用户信息
                        _renderHeaderInfo()
                      ],
                    )
                  ),
                ],
              ),
              new Positioned(
                left: 12.0,
                top: 213 - 28.0,
                child: new Container(
                  width: MediaQuery.of(context).size.width - 24.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28.0)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 16.0),
                        color: Color.fromRGBO(242, 75, 79, 0.2),
                        blurRadius: 25.0,
                        spreadRadius: -9.0)
                    ]
                  ),
                  child: _renderFloatingFansAndAttention(),
                ),
              )
            ],
          ),
        ),
        new Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (contentListResponse == null) {
                return  new Center(
                  child: new Text("该用户没有发布文章"),
                );
              } else {
                new ContentListView(data: contentListResponse.data.list[index]);
              }
            },
            itemCount: contentListResponse == null ? 1: contentListResponse.data.list.length,
          ),
        ),
      ],
    );
  }

  // 导航条
  Widget _renderNavigationBar() {
    return new Container(
      height: 64.0 + _statusBarHeight,
      child: new Align(
          alignment: Alignment.centerLeft,
          child: new CupertinoButton(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  // 用户头像 名字 金币数量
  Widget _renderHeaderInfo() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: <Widget>[
              // 头像
              new Container(
                width: 64.0,
                height: 64.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(widget.author.avatar),
                ),
              ),
              // 名字 金币
              new Container(
                padding: EdgeInsets.only(left: 12.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(widget.author.nick_name, style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "images/ic_userinfo_coin.png",
                          width: 15.0,
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text("0",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ),
        new Container(
          width: 74.0,
          height: 27.0,
          margin: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(27.0 / 2)),
          ),
          child: new CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: new Text("+ 关注",
                style: TextStyle(fontSize: 13.0, color: Colors.white)),
            onPressed: null
          ),
        )
      ],
    );
  }

  // 中间悬浮窗 粉丝 关注 数量
  Widget _renderFloatingFansAndAttention() {
    final fansCount = widget.author.fans_count == null ? 0 : widget.author.fans_count;
    final followCount = widget.author.follow_count == null ? 0: widget.author.follow_count;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CupertinoButton(
          child: RichText(
            text: TextSpan(
              text: "粉丝 ",
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
              children: [
                TextSpan(
                  text: "$followCount",
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold)
                )
              ]
            ),
          ),
          onPressed: () {
            toast(context, "粉丝");
          },
        ),
        Container(
          width: 2.0,
          height: 16.0,
          color: Colors.grey,
        ),
        CupertinoButton(
          child: RichText(
            text: TextSpan(
              text: "关注 ",
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
              children: [
                TextSpan(
                  text: "$followCount",
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold)
                )
              ]
            ),
          ),
          onPressed: () {
            toast(context, "关注");
          },
        ),
      ],
    );
  }


  static Future<double> get _getStatusBarHeight async {
    try {
      final double result =
          await platform.invokeMethod(Method.channel_getStatusBarHeight);
      return result;
    } on PlatformException catch (e) {
      Method.print2("PlatformException", "$e");
    }
    return 0.0;
  }
}
