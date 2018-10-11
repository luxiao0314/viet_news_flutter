import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viet_news_flutter/bean/TaskResponse.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var dataList = List<TaskBean>();

  @override
  void initState() {
    super.initState();
    loadData(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        body: new SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onOffsetChange: _onOffsetCallback,
          child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: _buildListItem,
              addRepaintBoundaries: false),
        ));
  }

//创建列表item
  Widget _buildListItem(BuildContext context, int index) {
    final bean = dataList[index];
    if (dataList[index].type == TaskResponse.TITLE) {
      //标题
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Container(
          decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.grey[200]),
            color: Colors.grey[200],
            borderRadius: new BorderRadius.all(new Radius.circular(60.0)),
          ),
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              bean.taskName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    } else if (dataList[index].type == TaskResponse.RANK) {
      //排名
      return Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment(0.9, -0.8),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
//                  border: new Border.all(width: 1.0, color: Colors.red[500]),
//                  color: Colors.red[500],
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  image: DecorationImage(
                    image: ExactAssetImage('images/ic_task_rank_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '每周前100名',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Text(
                            '瓜分2000000',
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23.0, vertical: 3.0),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(60.0)),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "查看", gravity: ToastGravity.CENTER);
                      },
                      minSize: 14.0,
                      child: Text(
                        "查看",
                        style:
                            TextStyle(color: Colors.red[500], fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                bean.taskName,
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              )
            ],
          ));
    } else if (dataList[index].type == TaskResponse.TASK) {
      //任务
      return Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Image.network(
              bean.taskIcon,
              width: 104.0,
              height: 80.0,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
//                      Expanded(
//                        child:
                      Text(
                        bean.taskName,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
//                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        child: _getScoreWidget(bean),
                      ),
                    ],
                  ),
                  Text(
                    '${bean.taskDesc}\n',
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey[500], fontSize: 14.0),
                  ),
                  _taskBottomWidget(bean),
                ],
              ),
            )),
            CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              color: Colors.red[500],
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "去邀请", gravity: ToastGravity.CENTER);
              },
              minSize: 13.0,
              child: Text(
                "去邀请",
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ],
        ),
      );
    } else {
      return Text('加载失败');
    }
  }

  Widget _taskBottomWidget(TaskBean bean) {
    if (bean == null ||
        bean.taskStatus == null ||
        bean.taskStatus.message == null ||
        bean.taskStatus.message.isEmpty) {
      if (bean.taskStatus.totalScore > 0) {
        return Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.red[500]),
                  value: bean.taskStatus.currentScore.toDouble() /
                      bean.taskStatus.totalScore),
              width: 77.0,
              height: 5.0,
            ),
            Text(
              '${bean.taskStatus.currentScore}/',
              style: TextStyle(color: Colors.red[500], fontSize: 12.0),
            ),
            Text(
              '${bean.taskStatus.totalScore}',
              style: TextStyle(color: Colors.red[500], fontSize: 11.0),
            ),
          ],
        );
      } else {
        return Text('');
      }
    } else
      return Text(
        bean.taskStatus.message,
        style: TextStyle(color: Colors.red[500], fontSize: 11.0),
      );
  }

  //刷新数据
  Future<void> _onRefresh(bool up) async {
    if(up){
      print('准备刷新');
      //模拟延迟1秒
      await Future.delayed(Duration(seconds: 1));
      print('开始刷新--1秒延迟后');
      loadData(false);
    }else{
      //footerIndicator Callback
    }
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }

  //加载本地JSON。需要在yaml中配置对应的文件
  Future<String> _loadJson() async {
    return await rootBundle.loadString('json/TaskResponse.json');
  }

  //去获取数据
  void loadData(bool loadMore) {
    print('开始刷新');
    _loadJson().then((json) {
      TaskResponse response = TaskResponse(json);
      setState(() {
        if (loadMore) {
          dataList.addAll(response.generateTaskList());
        } else {
          dataList = response.generateTaskList();
        }
      });
    });
  }

  Widget _getScoreWidget(TaskBean bean) {
    if (bean.taskScore > 0) {
      return Text(
        "+${bean.taskScore}",
        style: TextStyle(color: Colors.red[500], fontSize: 14.0),
      );
    } else {
      return Text("");
    }
  }
}
