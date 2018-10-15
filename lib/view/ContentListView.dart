import 'package:flutter/material.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';
import 'package:viet_news_flutter/res/style.dart';

typedef void OnClickContentListView(OnClickContentListType type, ContentListResponseList data);
enum OnClickContentListType { 
  header,
  content,
  coin,
  like,
  collection
}

class ContentListView extends StatefulWidget {
  ContentListView({
    Key key,
    this.data, 
    this.click
  }): super(key: key);
  final OnClickContentListView click;
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
        leading: new GestureDetector(
          onTap: () => widget.click(OnClickContentListType.header, widget.data),
          child: Row(
            children: <Widget>[
              Container(
                width: 22.0,
                height: 22.0,
                child: new CircleAvatar(
                  backgroundImage: NetworkImage(widget.data.author.avatar),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: new Text(widget.data.author.nick_name, style: TextStyle(color: Colors.black45)),
              ),
            ],
          ),
        ),
        trailing: new Text(_formaterDate(), style: TextStyle(color: Colors.black45)),
      )
    );
  }
 
  /// 2. 纯文字
  Widget _renderPureText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new GestureDetector(
        onTap: () => widget.click(OnClickContentListType.content, widget.data),
        child: new Text("深刻的飞机上来看大家反馈塑料袋金风科技拉克丝反馈说了的解放路口上岛咖啡建设路口"),
      ),
    );  
  }
  
  /// 3. 纯图片
  Widget _renderPureImages(BuildContext context) {
    final imageWidth = (MediaQuery.of(context).size.width-40) / 3;
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new GestureDetector(
        onTap: () => widget.click(OnClickContentListType.content, widget.data),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Image.network(widget.data.image_array[0].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
            new Image.network(widget.data.image_array[1].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
            new Image.network(widget.data.image_array[2].cover, height: 74.0, width: imageWidth, fit: BoxFit.cover),
          ],
        ),
      )
    );
  }
  
  /// 4. 文字加图片
  Widget _renderImageAndText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new GestureDetector(
        onTap: () => widget.click(OnClickContentListType.content, widget.data),
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
      ),
    );
  }

  /// 5. 按钮（金币 喜欢 收藏）
  Widget _renderOperatorButtons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new GestureDetector(
            onTap: () => widget.click(OnClickContentListType.coin, widget.data),
            child: Row(
              children: <Widget>[
                _assetIcon("images/ic_content_list_coin.png", OnClickContentListType.coin),
                new Text("${widget.data.content.view_number}", style: text_style_14_gray)
              ],
            ),
          ),
          new GestureDetector(
            onTap: () => widget.click(OnClickContentListType.like, widget.data),
            child: Row(
              children: <Widget>[
                _assetIcon("images/ic_content_list_like.png", OnClickContentListType.like),
                new Text("${widget.data.content.like_number}", style: text_style_14_gray)
              ],
            ),
          ),
          new GestureDetector(
            onTap: () => widget.click(OnClickContentListType.collection, widget.data),
            child: Row(
              children: <Widget>[
                _assetIcon("images/ic_content_list_collection.png", OnClickContentListType.collection),
                new Text("${widget.data.content.collection_number}", style: text_style_14_gray)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _assetIcon(String path, OnClickContentListType type, {double width = 17.0, double height = 17.0, Color color = Colors.grey}) {
    Widget _assetIconGetImage() {
      switch (type) {
        case OnClickContentListType.like:
          return Image.asset(
            path, 
            color: widget.data.content.like_flag ? Colors.red : color,
            width: width, 
            height: height
          );
        case OnClickContentListType.collection:
        return Image.asset(
            path, 
            color: widget.data.content.collection_flag? Colors.red : color,
            width: width, 
            height: height
          );
        default: 
        return Image.asset(
            path, 
            color: color,
            width: width, 
            height: height
          );
      }
    }
    return new Container(
      padding: EdgeInsets.only(right: 5.0),
      child: _assetIconGetImage()
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