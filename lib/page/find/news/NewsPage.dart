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
      enablePullUp: true,
      onRefresh: _onRefresh,
      onOffsetChange: _onOffsetCallback,
      controller: widget._refreshController,
      child: widget.datas[widget.channelId.toString()]==null||widget.datas[widget.channelId.toString()].length == 0 ?
          CustomScrollView() :
          ListView.builder(
            itemBuilder: (context, index) {
              final data = widget.datas[widget.channelId.toString()][index];
              return new ContentListView(
                data: data,
                click: (type, data) => _onClickContentList(type, data),
              );
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
      widget.count = 1;
    } else {
      widget.count++;
    }
    _getContentList(up);
  }

  Future<void> _initializeData() async {
    _getContentList();
  }

  Future<void> _getContentList([bool up]) async {
    final params = {"page_number": widget.count, "page_size": "10", "channel_id": 3};
    final response = await ApiService().getContentList(params);
    print("response: $response");
    print("channelId: ${widget.channelId}");
    final result = ContentListResponse(response.data);
    setState(() {
      if (up != null) {
        if (up) {
          // 下拉刷新更多数据
          widget.datas[widget.channelId.toString()].insertAll(0, result.data.list);
          widget._refreshController.sendBack(up, RefreshStatus.completed);
        } else {
          // 上拉加载更多
          print(up);
          print(result.data.list.length);
          if (result.data.list.length <= 0) {
            widget._refreshController.sendBack(up, RefreshStatus.noMore);
            return;
          }
          widget.datas[widget.channelId.toString()].addAll(result.data.list);
          widget._refreshController.sendBack(up, RefreshStatus.idle);
        }
      } else {
        widget.datas[widget.channelId.toString()] = result.data.list;
      }
    });
  }

  // 点击头像名字 内容 金币 喜欢 收藏 事件
  void _onClickContentList(OnClickContentListType type, ContentListResponseList data) {
    print(type);
  }


  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
