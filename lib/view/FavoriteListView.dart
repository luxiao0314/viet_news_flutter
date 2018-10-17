import 'package:flutter/material.dart';
import 'package:viet_news_flutter/bean/FavoriteListResponse.dart';

typedef void OnClickFavoriteListView(OnClickFavoriteListType type, FavoriteData data);
enum OnClickFavoriteListType {
  header,
  content,
}

class FavoriteListView extends StatefulWidget {
  FavoriteListView({Key key, this.data, this.click}) : super(key: key);
  final OnClickFavoriteListView click;
  final FavoriteData data;

  _FavoriteListViewState createState() => new _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: _render(),
    );
  }

  Widget _render() {
    if (widget.data.content.content_type == 2 ||
        widget.data.content.content_type == 1) {
      // 图片+文字
      return Column(
        children: <Widget>[_renderImageAndText(), new Divider()],
      );
    } else if (widget.data.content.content_type == 3) {
      return Column(
        children: <Widget>[_renderPureText(), new Divider()],
      );
    } else {
      return Text('没有该类型');
    }
  }

  /// 2. 纯文字
  Widget _renderPureText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new GestureDetector(
        onTap: () => widget.click(OnClickFavoriteListType.content, widget.data),
        child: new Text("深刻的飞机上来看大家反馈塑料袋金风科技拉克丝反馈说了的解放路口上岛咖啡建设路口"),
      ),
    );
  }

  /// 4. 文字加图片
  Widget _renderImageAndText() {
    return Container(
      padding: EdgeInsets.only(bottom: 12.0),
      child: new GestureDetector(
        onTap: () => widget.click(OnClickFavoriteListType.content, widget.data),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(right: 10.0),
              child: new Image.network(widget.data.image_array[0].cover,
                  fit: BoxFit.cover, width: 114.0, height: 74.0),
            ),
            new Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    widget.data.content.content_title,
                    style: TextStyle(fontSize: 16.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
