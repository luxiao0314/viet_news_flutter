import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  final _refreshController = RefreshController();
  int count = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
    print("FavoritePage initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(Local.of(context).favorite,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: 0.0,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onOffsetChange: _onOffsetCallback,
        controller: _refreshController,
        child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            child: Text("123"),
          );
        }),
      ),
    );
  }

  Future<void> _onRefresh(bool up) async {
    if (up) {
      count = 1;
    } else {
      count++;
    }
//    _getContentList(up);
  }

  Future<void> _initializeData() async {
    _getContentList();
  }

  Future<void> _getContentList([bool up]) async {
    final params = {
      "page_number": count,
      "page_size": "10",
      "user_id": 1,
      "channel_id": 3
    };
    final response = await Fetch.init.post(ApiService.list4collection, data: params);
    print(response);
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
