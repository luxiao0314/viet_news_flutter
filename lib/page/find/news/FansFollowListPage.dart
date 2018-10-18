import 'package:flutter/material.dart';

class FansFollowListPage extends StatefulWidget {

  State<FansFollowListPage> createState() => _FansFollowListPageState();
}

class _FansFollowListPageState extends State<FansFollowListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: TabBar(
          tabs: <Widget>[
            new Text("粉丝"),
            new Text("关注")
          ],
        ),
      ),
    );
  }
}