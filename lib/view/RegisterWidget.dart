import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';

typedef void OnNextClickListener();

class RegisterWidget extends StatefulWidget {
  final OnNextClickListener onNextClick;

  RegisterWidget({Key key, this.onNextClick})
      : assert(onNextClick != null),
        super(key: key);

  @override
  _RegisterWidgetState createState() => new _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsetsDirectional.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 10.0), child: Text("+86")),
              Expanded(
                  child: TextField(
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
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: '验证码', border: InputBorder.none),
                  )),
              Expanded(
                  child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                color: Colors.red[500],
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                onPressed: () => toast(context, "获取验证码"),
                minSize: 13.0,
                child: Text(
                  "获取验证码",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ))
            ],
          ),
          Divider(),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: '输入邀请码(非必填)', border: InputBorder.none),
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
              onPressed: () => widget.onNextClick(),
              minSize: 13.0,
              child: Text(
                "下一步",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
