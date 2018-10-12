import 'package:flutter/material.dart';

class ContentListView extends StatefulWidget {
  _ContentListViewState createState() => new _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          _renderHeader(),
          _renderPureText(),
          _renderPureImages(context),
          _renderImageAndText(),
          _renderOperatorButtons(),
          new Divider()
        ],
      ),
    );
  }

  /// 内容类型包括头部和底部共有5种
  /// 1. 头部 （头像 名字 时间）
  Widget _renderHeader() {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        leading: Row(
          children: <Widget>[
            new CircleAvatar(
              backgroundImage: NetworkImage("http://img4.duitang.com/uploads/item/201411/09/20141109142633_ncKBY.thumb.700_0.jpeg"),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: new Text('DDDKid', style: TextStyle(color: Colors.black45)),
            ),
          ],
        ),
        trailing: new Text('10小时前', style: TextStyle(color: Colors.black45)),
      )
    );
  }
 
  /// 2. 纯文字
  Widget _renderPureText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new Text("川普在华府时间6月18日透过白宫声明表示，若中方不改善不公平贸易的行为，坚持采取报复措施", style: TextStyle(fontSize: 16.0)),
    );  
  }
  
  /// 3. 纯图片
  Widget _renderPureImages(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width-40) / 3;
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.asset("images/ic_temp_find.jpg", height: 74.0, width: imageWidth, fit: BoxFit.cover),
          new Image.asset("images/ic_temp_find.jpg", height: 74.0, width: imageWidth, fit: BoxFit.cover),
          new Image.asset("images/ic_temp_find.jpg", height: 74.0, width: imageWidth, fit: BoxFit.cover),
        ],
      ),
    );
  }
  
  /// 4. 文字加图片
  Widget _renderImageAndText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(right: 10.0),
            child: new Image.asset("images/ic_temp_find.jpg", fit: BoxFit.cover, width: 114.0, height: 74.0),
          ),
          new Expanded(
            child: new Text("过去十年，中共铺设的高铁线路占去了全世界的2/3。已经成了世界上最大的高铁网络", style: TextStyle(fontSize: 16.0),),
          )
        ],
      ),
    );
  }

  /// 5. 按钮（金币 喜欢 收藏）
  Widget _renderOperatorButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              new Icon(Icons.favorite, color: Colors.red),
              new Text("1000")
            ],
          ),
          Row(
            children: <Widget>[
              new Icon(Icons.favorite, color: Colors.red),
              new Text("1000")
            ],
          ),
          Row(
            children: <Widget>[
              new Icon(Icons.favorite, color: Colors.red,),
              new Text("1000")
            ],
          ),
        ],
      ),
    );
  }
}