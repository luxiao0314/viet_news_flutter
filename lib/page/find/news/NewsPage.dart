import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/view/ContentListView.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';

class NewsPage extends StatefulWidget {
  NewsPage(this.channelId);
  final int channelId;
  final Map<String, List<ContentListResponseList>> datas = Map();
  final _refreshController = RefreshController();
  int count = 0;
  @override
  State<StatefulWidget> createState() => _NewsPageStatus();
}

class _NewsPageStatus extends State<NewsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final lists = widget.datas[widget.channelId.toString()];
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: _onRefresh,
      onOffsetChange: _onOffsetCallback,
      controller: widget._refreshController,
      child: lists==null||lists.length == 0 ?
          CustomScrollView() :
          ListView.builder(
            itemBuilder: (context, index) {
              final data = lists[index];
              return new ContentListView(data: data);
            },
            itemCount: lists.length,
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _onRefresh(bool up) async {
    if(up) {
      widget.count++;
    } else {
      widget.count--;
    }
    _getChannelList(up);
  }

  Future<void> _initializeData() async {
    _getChannelList();
  }

  Future<void> _getChannelList([bool up]) async {
    Options options = Options(
      baseUrl: "http://magicbox.liaoyantech.cn:80/magicbox/api/v1/",
      data: {"page_number": "1", "page_size": "10", "channel_id": 3},
      headers: {"Authorization":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjE1NjE4MTUwNjE1Iiwicm9sZUlkIjoiMSIsImlzcyI6Im1lcmN1bGV0IiwiZXhwIjoxNTM5NDE0NTExLCJ1c2VySWQiOiIxNCIsImlhdCI6MTUzNjgyMjUxMX0.FfR9nBnLqgeBBT2Ei0b88zSNJfDxm99KtO4Yf49DfbA"},
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    final dio = Dio(options);
    final response = await dio.post("content/list4Channel");
    print("response: $response");
    print("channelId: ${widget.channelId}");
    final result = ContentListResponse(response.data);
    setState(() {
      widget.datas[widget.channelId.toString()] = result.data.list;
      if (up != null) {
        widget._refreshController.sendBack(up, RefreshStatus.completed);
      }
    });
  }


  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
