import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/bean/ChannelResponse.dart';
import 'package:viet_news_flutter/local/NewsLocalizations.dart';
import 'package:viet_news_flutter/page/find/channel/ChannelPage.dart';
import 'package:viet_news_flutter/page/find/news/NewsPage.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindPageStatus();
}

class _FindPageStatus extends State<FindPage> with TickerProviderStateMixin {
  List<ChannelBean> tabList = List<ChannelBean>();
  TabController _controller;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _getAllChannelList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(NewsLocalizations.of(context).find),
        bottom: _initTabBar(),
        backgroundColor: Colors.red[500],
        elevation: 0.0,
      ),
      body: _initPageView(),
    );
  }

  List<Widget> _getTabs() {
    return tabList.map((channelBean) {
      return Text(channelBean.channel_name);
    }).toList();
  }

  List<Widget> _getTabViewPages() {
    return tabList.map((channelBean) {
      return GestureDetector(
        child: Center(
          child: NewsPage(channelBean.channel_key),
        ),
        onTap: () {
          Fluttertoast.showToast(
              msg: channelBean.channel_name, gravity: ToastGravity.CENTER);
//          _getAllChannelList();
        },
      );
    }).toList();
  }

  void _getAllChannelList() async {
    Dio dio = Dio();
    dio.options.responseType = ResponseType.PLAIN;
    dio.options.baseUrl = 'http://magicbox.liaoyantech.cn/magicbox/api/';
    dio.post("v1/channel/list").then((resData) {
      String json = resData.data.toString();
      print(json);
      ChannelResponse response = ChannelResponse(json);
      tabList = response.data;
      setState(() {
        _controller = TabController(length: tabList.length, vsync: this);
        _controller.addListener(() {
          _currentTab = _controller.index;
        });
      });
    });
  }

  Widget _initTabBar() {
    if (_controller != null && _controller.length > 0) {
      return PreferredSize(
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TabBar(
                      indicator: BoxDecoration(),
                      isScrollable: true,
                      controller: _controller,
                      labelColor: Colors.red[500],
                      unselectedLabelColor: Colors.black,
                      tabs: _getTabs(),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: _onAddTap,
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(40.0));
    } else {
      return null;
    }
  }

  Widget _initPageView() {
    if (_controller != null && _controller.length > 0) {
      return TabBarView(
        controller: _controller,
        children: _getTabViewPages(),
      );
    } else {
      return null;
    }
  }

  void _onAddTap() {
    Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(builder: (context) {
      return ChannelPage();
    }));
  }
}


