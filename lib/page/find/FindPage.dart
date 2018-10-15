import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/bean/AllChannelListResponse.dart';
import 'package:viet_news_flutter/bean/ChannelBean.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/model/response/ChannelResponse.dart';
import 'package:viet_news_flutter/page/find/channel/ChannelPage.dart';
import 'package:viet_news_flutter/page/find/news/NewsPage.dart';
import 'package:viet_news_flutter/res/colors.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindPageStatus();
}

class _FindPageStatus extends State<FindPage> with TickerProviderStateMixin {
  List<ChannelBean> tabList = List<ChannelBean>();
  ChannelAllListResponse channelAllListResponse;
  TabController _controller;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _getChannelList();
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
        title: Text(Local.of(context).find),
        bottom: _initTabBar(),
        backgroundColor: primary_red,
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
          child: NewsPage(channelBean.id)
        ),
      );
    }).toList();
  }

  void _getAllChannelList() {
    Future<Response> future = ApiService().getAllChannelList();
    future.then((resData) {
      String json = resData.data.toString();
      print(json);
      channelAllListResponse = ChannelAllListResponse(json);
    });
  }

  void _getChannelList() {
    Future<Response> future = ApiService().getChannelList();
    future.then((resData) {
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
                    labelColor: text_red,
                    unselectedLabelColor: text_black,
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
    if (channelAllListResponse != null &&
        channelAllListResponse.data != null &&
        channelAllListResponse.data.unFollowChannelList != null &&
        channelAllListResponse.data.followChannelList != null) {
      Navigator.of(context, rootNavigator: true)
          .push(CupertinoPageRoute(builder: (context) {
        return ChannelPage(
            followList: channelAllListResponse.data.followChannelList,
            unFollowList: channelAllListResponse.data.unFollowChannelList);
      }));
    }
  }
}
