import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/mine/LoginPage.dart';
import 'package:viet_news_flutter/local/NewsLocalizations.dart';

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
          title: Text(NewsLocalizations.of(context).mine,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: new Container(
            child: new Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(new CupertinoPageRoute(builder: (context) {
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
