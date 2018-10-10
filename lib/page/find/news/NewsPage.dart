import 'dart:async';

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage(this.channelId);
  final String channelId;
  int count = 0;
  @override
  State<StatefulWidget> createState() => _NewsPageStatus();
}

class _NewsPageStatus extends State<NewsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                "channelId = ${widget.channelId} , index = $index , count = ${widget.count}",
                style: TextStyle(color: Colors.red[500]),
              ),
            );
          }),
    );
  }

  Future<void> _onRefresh() async {
    setState(() {
      widget.count++;
    });
  }
}
