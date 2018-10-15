import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:viet_news_flutter/view/ContentListView.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import '../../../http/APIService.dart';

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
    // final lists = widget.datas[widget.channelId.toString()];
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: _onRefresh,
      onOffsetChange: _onOffsetCallback,
      controller: widget._refreshController,
      child: widget.datas[widget.channelId.toString()]==null||widget.datas[widget.channelId.toString()].length == 0 ?
          CustomScrollView() :
          ListView.builder(
            itemBuilder: (context, index) {
              final data = widget.datas[widget.channelId.toString()][index];
              return new ContentListView(data: data);
            },
            itemCount: widget.datas[widget.channelId.toString()].length,
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
    final params = {"page_number": "1", "page_size": "10", "channel_id": 3};
    final response = await ApiService().getContentList(params);
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
