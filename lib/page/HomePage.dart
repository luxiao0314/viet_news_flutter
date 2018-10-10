import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/find/FindPage.dart';
import 'package:viet_news_flutter/page/follow/FollowPage.dart';
import 'package:viet_news_flutter/page/mine/MinePage.dart';
import 'package:viet_news_flutter/page/task/TaskPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = [
      BottomNavigationBarItem(
          icon: Icon(Icons.find_replace), title: Text('Find')),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), title: Text('Follow')),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_border), title: Text('Task')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Mine')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //缓存首页四个界面的数据
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          FindPage(),
          FollowPage(),
          TaskPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationViews,
        currentIndex: _currentIndex,
        onTap: _onPageChange,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onPageChange(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
