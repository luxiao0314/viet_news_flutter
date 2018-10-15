import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';
import 'package:viet_news_flutter/res/colors.dart';

typedef void OnNextClickListener();

class NextRegisterWidget extends StatefulWidget {
  final OnNextClickListener onNextClick;

  NextRegisterWidget({Key key, this.onNextClick}) : super(key: key);

  @override
  _NextRegisterWidgetState createState() => new _NextRegisterWidgetState();
}

class _NextRegisterWidgetState extends State<NextRegisterWidget> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsetsDirectional.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsetsDirectional.only(bottom: 40.0),
              padding: EdgeInsetsDirectional.only(
                  top: 15.0, bottom: 15.0, end: 40.0, start: 40.0),
              decoration: BoxDecoration(
                  color: tips_blue,
                  borderRadius: const BorderRadius.all(Radius.circular(60.0))),
              child: Text("密码可使用字母、数字、字符两者组合，限8～20位",
                  style: TextStyle(fontSize: 12.0, color: text_blue))),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: '设置密码', border: InputBorder.none),
                  ))
            ],
          ),
          Divider(),
          TextField(
            controller: _controller,
            decoration:
                InputDecoration(hintText: '再次输入密码', border: InputBorder.none),
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
              onPressed: () => toast(context, "注册"),
              minSize: 13.0,
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
