import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/page/mine/LoginPage.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/util/User.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageStatus();
}

class _MinePageStatus extends State<MinePage> with TickerProviderStateMixin {
  String userName;

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
    Widget userItem = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(right: 32.0),
            child: new Image.asset("images/ic_default_article.png",
                width: 100.0, height: 100.0, fit: BoxFit.cover),
          ),
          new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    userName == null
                        ? Local.of(context).login_please
                        : userName,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                    "${Local.of(context).fans} 1.2w | ${Local.of(context).attention} 10",
                    style: new TextStyle(
                      color: Colors.grey[500],
                    )),
              ])),
          new Container(
            margin: const EdgeInsets.only(left: 5.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.all(Radius.circular(60.0))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                Text(
                  Local.of(context).edit,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );

    Widget logout = new ListTile(
        leading: const Icon(Icons.info),
        title: Text(Local.of(context).logout),
        trailing:
            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () async {
          User.currentUser.logout();
          setState(() {
            userName = null;
          });
        });

    return Scaffold(
        appBar: AppBar(
          title: Text(Local.of(context).mine,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: text_black)),
          centerTitle: true,
          backgroundColor: bg_white,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            userItem,
            SettingsGroup(<Widget>[
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).my_wallet,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    } else {
                      print('aaron login');
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).invite_friends,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    } else {
                      print('aaron login');
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).favorite,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    } else {
                      print('aaron login');
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).settings,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    } else {
                      print('aaron login');
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                    }
                  });
                },
              ),
            ])
          ],
        ));
  }
}
