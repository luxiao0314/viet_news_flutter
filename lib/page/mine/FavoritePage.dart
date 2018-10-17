import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_news_flutter/bean/FavoriteListResponse.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/util/tools.dart';
import 'package:viet_news_flutter/view/FavoriteListView.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> with TickerProviderStateMixin {
  List<FavoriteData> data = List();
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
          child: data == null || data.length == 0
              ? CustomScrollView()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final datas = data[index];
                    return new FavoriteListView(
                      data: datas,
                      click: (type, datas) => _onClickFavoriteList(type, datas),
                    );
                  },
                  itemCount: data.length,
                )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print2("dispose", "isDispose = true");
  }

  Future<void> _onRefresh(bool up) async {
    if (up) {
      count = 1;
    } else {
      count++;
    }
    _getFavoriteList(up);
  }

  Future<void> _initializeData() async {
    _getFavoriteList();
  }

  Future<void> _getFavoriteList([bool up]) async {
    final params = {
      "page_number": count,
      "page_size": "10",
      "user_id": 1,
      "channel_id": 3
    };
    final response =
        await Fetch.init.post(ApiService.list4collection, data: params);
    print(response);
    final result = FavoriteListResponse(response);
    setState(() {
      if (up != null) {
        if (up) {
          //下拉刷新
          data.insertAll(0, result.data.list);
          _refreshController.sendBack(up, RefreshStatus.completed);
        } else {
          //上拉加载
          if (result.data.list.length <= 0) {
            _refreshController.sendBack(up, RefreshStatus.noMore);
            return;
          }
          data.addAll(result.data.list);
          _refreshController.sendBack(up, RefreshStatus.idle);
        }
      } else {
        data = result.data.list;
      }
    });
  }

  _onClickFavoriteList(OnClickFavoriteListType type, FavoriteData datas) {}

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
