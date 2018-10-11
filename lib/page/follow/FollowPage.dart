import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/NewsLocalizations.dart';

class FollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FollowPageStatus();
}

class _FollowPageStatus extends State<FollowPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NewsLocalizations.of(context).follow),
        centerTitle: true,
        backgroundColor: Colors.red[500],
        elevation: 0.0,
      ),
      body: Center(
        child: Text('Follow'),
      ),
//

//
    );
  }
}
