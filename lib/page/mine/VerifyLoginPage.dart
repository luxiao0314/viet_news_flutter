import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';

class VerifyLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VerifyStatus();
}

class _VerifyStatus extends State<VerifyLoginPage> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10.0), child: Text("+86")),
              Expanded(
                  child: TextField(
                autocorrect: true,
                //是否自动更正
                autofocus: true,
                //是否自动对焦
                maxLines: 1,
                controller: _controller,
                decoration:
                    InputDecoration(hintText: '手机号', border: InputBorder.none),
              ))
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: TextField(
                    autocorrect: true,
                    //是否自动更正
                    autofocus: true,
                    //是否自动对焦
                    maxLines: 1,
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: '验证码', border: InputBorder.none),
                  )),
              Expanded(
                  child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                color: Colors.red[500],
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                onPressed: () => toasts("获取验证码"),
                minSize: 13.0,
                child: Text(
                  "获取验证码",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ))
            ],
          ),
          Divider(),
          Container(
            height: 50.00,
            width: 400.00,
            margin: EdgeInsets.only(top: 20.0),
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.red[500],
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
              onPressed: () => toasts("登录"),
              minSize: 13.0,
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
