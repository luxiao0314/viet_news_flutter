import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/view/ContentListView.dart';

class FollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FollowPageStatus();
}

class _FollowPageStatus extends State<FollowPage>
    with TickerProviderStateMixin {
  RefreshController _refreshController;
  List<ContentListResponseList> _dataList;
  int count = 0;
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _initFollowData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _dataList == null || _dataList.length == 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(Local.of(context).follow),
        centerTitle: true,
        backgroundColor: primary_red,
        elevation: elevation_low,
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: !isEmpty,
          onRefresh: _onRefresh,
          onOffsetChange: _onOffsetCallback,
          controller: _refreshController,
          child: isEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 400.0,
                      child: Center(
                        child: Text(
                          "空空空空空\n\n\n抱歉！我是个墨的感情的杀手~",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  itemCount: 1,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final data = _dataList[index];
                    return new ContentListView(
                      data: data,
                      click: (type, data) => _onClickContentList(type, data),
                    );
                  },
                  itemCount: _dataList.length,
                )),
//

//
    );
  }

  void _onRefresh(bool up) {
    if (up) {
      count = 1;
    } else {
      count++;
    }
    _initFollowData(up);
  }

  void _onOffsetCallback(bool up, double offset) {}

  _onClickContentList(
      OnClickContentListType type, ContentListResponseList data) {}

  void _initFollowData([bool up]) async {
    final param = {"page_number": 1, "page_size": 10, "user_id": "1"};
    final result = await Fetch.init.post(ApiService.list4Channel, data: param);
    final response = ContentListResponse(result);

    setState(() {
      if (up != null) {
        if (up) {
          // 下拉刷新更多数据
          _dataList = response.data.list;

          _refreshController.sendBack(up, RefreshStatus.completed);
        } else {
          // 上拉加载更多
          if (result.data.list.length <= 0) {
            _refreshController.sendBack(up, RefreshStatus.noMore);
            return;
          }
          _dataList.addAll(response.data.list);
          _refreshController.sendBack(up, RefreshStatus.idle);
        }
      } else {
        _dataList = response.data.list;
      }
    });
  }
}
