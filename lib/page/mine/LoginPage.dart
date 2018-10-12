import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/page/mine/LoginSubPage.dart';
import 'package:viet_news_flutter/page/mine/PwdLoginPage.dart';
import 'package:viet_news_flutter/page/mine/RegisterPage.dart';

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
        body:
            new TabBarView(children: [new RegisterPage(), new LoginSubPage()]),
      ),
    );
  }

  Widget _initTabBar() {
    return PreferredSize(
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
        ),
        preferredSize: Size.fromHeight(50.0));
  }
}
