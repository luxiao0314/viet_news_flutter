import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';

class PwdLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PwdLoginStatus();
}

class _PwdLoginStatus extends State<PwdLoginPage> {
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
                  child: new TextField(
                controller: _controller,
                decoration: new InputDecoration(
                    hintText: '手机号', border: InputBorder.none),
              ))
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                        hintText: '输入密码', border: InputBorder.none),
                  )),
              Expanded(
                  child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                onPressed: () => toast("忘记密码?"),
                minSize: 13.0,
                child: Text(
                  "忘记密码?",
                  style: TextStyle(color: Colors.black, fontSize: 13.0),
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
              onPressed: () => toast("登录"),
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
