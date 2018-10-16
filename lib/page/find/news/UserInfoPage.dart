import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserInfoPage extends StatefulWidget {
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _renderNavigationBar()),
    );
  }

  // navigationBar
  Widget _renderNavigationBar() {
    return Container(
      child: Column(
        children: <Widget>[
          // 导航条
          new Container(
            height: 64.0,
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new CupertinoButton(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ),
          ),
          // 用户信息
          new Row(
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
                        backgroundImage: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539670545988&di=212c1e62dc572f28bd4bef575e96a6d3&imgtype=0&src=http%3A%2F%2Fwww.qqpk.cn%2FArticle%2FUploadFiles%2F201111%2F20111121100026559.jpg"),
                      ),
                    ),
                    // 名字 金币
                    new Container(
                      padding: EdgeInsets.only(left: 12.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("李晓明"),
                          Row(
                            children: <Widget>[
                              Icon(Icons.color_lens, color: Colors.yellow),
                              Text("10.67w")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: 74.0,
                height: 27.0,
                margin: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(27.0/2)),
                ),
                child: new CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: new Text("+ 关注", style: TextStyle(fontSize: 13.0, color: Colors.white)),
                  onPressed: null
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
