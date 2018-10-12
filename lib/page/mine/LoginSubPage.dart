import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/mine/PwdLoginPage.dart';
import 'package:viet_news_flutter/page/mine/VerifyLoginPage.dart';

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
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 40.0),
        child: new DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                isScrollable: true,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "密码登录"),
                  Tab(text: "验证登录"),
                ],
              ),
              body: TabBarView(children: [PwdLoginPage(), VerifyLoginPage()]),
            )));
  }
}
