import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';
import 'package:viet_news_flutter/page/mine/LoginSubPage.dart';
import 'package:viet_news_flutter/page/mine/PwdLoginPage.dart';
import 'package:viet_news_flutter/page/mine/RegisterPage.dart';
import 'package:viet_news_flutter/res/colors.dart';

/// @Description 登录页面
/// @Author sean
/// @Email xiao.lu@magicwindow.cn
/// @Date 10/10/2018 4:48 PM
/// @Version 1.0.0
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageStatus();
}

class _LoginPageStatus extends State<LoginPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: AppBar(
            leading: Icon(null), //让back按钮不再显示
            elevation: 0.0,
            backgroundColor: Colors.white,
            bottom: _initTabBar()),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
              child: TabBarView(children: [RegisterPage(), LoginSubPage()])),
          Container(
              height: 50.00,
              width: 250.00,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                color: btn_blue,
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                onPressed: () => toast("Facebook登录"),
                minSize: 13.0,
                child: Text(
                  "Facebook登录",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 20.0,top: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("注册/登录即代表您同意"),
                    Text("《MagicBox协议》", style: TextStyle(color: Colors.blue))
                  ]))
        ],
      ),
    );
  }

  Widget _initTabBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          height: 99.0,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: CloseButton(),
              ),
              Expanded(
                  child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: TabBar(
                  indicator: BoxDecoration(),
                  isScrollable: true,
//                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  labelStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: "注册账号"),
                    Tab(text: "登录"),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
