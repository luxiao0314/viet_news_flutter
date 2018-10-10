import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/mine/LoginPage.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageStatus();
}

class _MinePageStatus extends State<MinePage> with TickerProviderStateMixin {
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
          title: Text('Mine'),
        ),
        body: SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new LoginPage();
                    }));
                  },
                  child: Center(
                    child: Text("login"),
                  ),
                ),
              ],
            ),
          ),
        )
//

//
        );
  }
}
