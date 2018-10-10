import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: Text("login"),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            tabs: [
              new Tab(text: "注册账号"),
              new Tab(text: "登录"),
            ],
          ),
        ),
        body: new TabBarView(children: [new RegisterPage(), new RegisterPage()]),
      ),
    );
  }
}
