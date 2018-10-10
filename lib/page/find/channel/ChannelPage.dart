import 'package:flutter/material.dart';
import 'package:viet_news_flutter/view/SortableGridView.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChannelPageStatus();
}

class _ChannelPageStatus extends State<ChannelPage> {
  List<String> channelItems = List<String>();
  @override
  void initState() {
    super.initState();
    for (int x = 0; x < 20; x++) {
      channelItems.add("x=${x * x}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: EdgeInsets.only(top: 50.0, right: 20.0),
          child: Container(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SortableGridView(
        channelItems,
        childAspectRatio: 3.0,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        canAccept: (oldIndex, newIndex) {
          return true;
        },
        itemBuilder: (context, data) {
          return Card(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Center(
              child: Text(data),
            ),
          ));
        },
      ),
    ));
  }
}
