import 'package:flutter/material.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import 'package:viet_news_flutter/res/style.dart';

class ContentListView extends StatefulWidget {
  ContentListView({this.data});
  final ContentListResponseList data;
  _ContentListViewState createState() => new _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: _render(),
    );
  }

  Widget _render() {
    if (widget.data.content.content_type == 1) {
      // 三张图片
      return Column(
        children: <Widget>[
          _renderHeader(),
          _renderPureImages(context),
          _renderOperatorButtons(),
          new Divider()
        ],
      );
    } else if (widget.data.content.content_type == 2) {
      // 图片+文字
      return Column(
        children: <Widget>[
          _renderHeader(),
          _renderImageAndText(),
          _renderOperatorButtons(),
          new Divider()
        ],
      );
    } else if (widget.data.content.content_type == 3) {
      return Column(
        children: <Widget>[
          _renderHeader(),
          _renderPureText(),
          _renderOperatorButtons(),
          new Divider()
        ],
      );
    } else {
      return Text('没有该类型');
    }

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
              backgroundImage: NetworkImage(widget.data.author.avatar),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: new Text(widget.data.author.nick_name, style: TextStyle(color: Colors.black45)),
            ),
          ],
        ),
        trailing: new Text(_formaterDate(), style: TextStyle(color: Colors.black45)),
      )
    );
  }
 
  /// 2. 纯文字
  Widget _renderPureText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new Text(widget.data.content.content_title, style: TextStyle(fontSize: 16.0)),
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
          new Image.network(widget.data.image_array[0].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
          new Image.network(widget.data.image_array[1].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
          new Image.network(widget.data.image_array[2].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
        ],
      ),
    );
  }
  
  /// 4. 文字加图片
  Widget _renderImageAndText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(right: 10.0),
            child: new Image.network(widget.data.image_array[0].cover, fit: BoxFit.cover, width: 114.0, height: 74.0),
          ),
          new Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: new Text(widget.data.content.content_title, style: TextStyle(fontSize: 16.0),)
            ),
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
              _assetIcon("images/ic_content_list_coin.png"),
              new Text("${widget.data.content.view_number}", style: text_style_14_gray)
            ],
          ),
          Row(
            children: <Widget>[
              _assetIcon("images/ic_content_list_like.png"),
              new Text("${widget.data.content.like_number}", style: text_style_14_gray)
            ],
          ),
          Row(
            children: <Widget>[
              _assetIcon("images/ic_content_list_collection.png"),
              new Text("${widget.data.content.collection_number}", style: text_style_14_gray)
            ],
          ),
        ],
      ),
    );
  }

  _assetIcon(String path, {double width = 17.0, double height = 17.0, Color color = Colors.grey}) {
    return new Container(
      padding: EdgeInsets.only(right: 5.0),
      child:Image.asset(path, color: color, width: width, height: height)
    );
  }

  // 格式化时间
  String _formaterDate() {
    final dTime = widget.data.content.createDateTime;
    final createTime = DateTime.fromMillisecondsSinceEpoch(dTime);
    String monthStr = "";
    String dayStr = "";
    if (createTime.month < 10) {
      monthStr = "0${createTime.month}";
    }
    if (createTime.day < 10) {
      dayStr = "0${createTime.day}";
    }
    return "${createTime.year}-$monthStr-$dayStr";
  }
}