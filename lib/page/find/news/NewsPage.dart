import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:viet_news_flutter/page/WebViewPage.dart';
import 'package:viet_news_flutter/util/tools.dart';
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

  @override
  void dispose() {
    super.dispose();
    print2("dispose", "isDispose = true");
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
    print2("response", response);
    final result = ContentListResponse(response.data);
    setState(() {
      if (up != null) {
        if (up) {
          // 下拉刷新更多数据
          widget.datas[widget.channelId.toString()].insertAll(0, result.data.list);
          widget._refreshController.sendBack(up, RefreshStatus.completed);
        } else {
          // 上拉加载更多
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
  Future<Null> _onClickContentList(OnClickContentListType type, ContentListResponseList data) async{
    print(type);
    switch (type) {
      case OnClickContentListType.header:
        // 跳转到个人信息页面
        break;
      case OnClickContentListType.content:
        // 跳转到内容页
        saveWebDetailPresference(data.content.content_detail, data.content.content_title).then((_) {
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => new WebViewPage()
            )
          );
        }, onError: (error) {
          print(error);
        });
        break;
      case OnClickContentListType.coin:
        // 跳转到金币页
        break;
      case OnClickContentListType.like:
        // 调用喜欢接口
        final result = await ApiService().requestContentListLike(data.content.id.toString());
        final jsonRes = json.decode(result.data);
        if (jsonRes["message"].toString() == "success") {
          data.content.like_flag = true;
          data.content.like_number = jsonRes["data"];
          setState(() {});
        }
        break;
      case OnClickContentListType.collection:
        // 调用收藏接口
        final result = await ApiService().requestContentListCollection(data.content.id.toString());
        final jsonRes = json.decode(result.data);
        if (jsonRes["message"].toString() == "success") {
          data.content.collection_flag = true;
          data.content.collection_number = jsonRes["data"];
          setState(() {});
        }
        break;
    }
  }


  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
