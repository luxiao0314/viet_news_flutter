import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/page/mine/PwdLoginPage.dart';
import 'package:viet_news_flutter/page/mine/RegisterPage.dart';

/// @Description 登录页面
/// @Author sean
/// @Email xiao.lu@magicwindow.cn
/// @Date 10/10/2018 4:48 PM
/// @Version 1.0.0
class LoginSubPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginSubPageStatus();
}

class _LoginSubPageStatus extends State<LoginSubPage>
    with TickerProviderStateMixin {
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
            new TabBarView(children: [new PwdLoginPage(), new PwdLoginPage()]),
      ),
    );
  }

  Widget _initTabBar() {
    return PreferredSize(
        child: Container(
          height: 50.0,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: TabBar(
              indicatorColor: Colors.red,
              isScrollable: true,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "密码登录"),
                Tab(text: "验证登录"),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(50.0));
  }
}
