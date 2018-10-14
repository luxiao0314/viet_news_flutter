import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/bean/ChannelBean.dart';
import 'package:viet_news_flutter/view/SortableGridView.dart';

class ChannelPage extends StatefulWidget {
  final List<ChannelBean> followList;
  final List<ChannelBean> unFollowList;

  const ChannelPage({Key key, this.followList, this.unFollowList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChannelPageStatus();
}

class _ChannelPageStatus extends State<ChannelPage> {
  var _canDrag = false; //当前是否可拖动排序

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.only(top: 50.0, right: 20.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: CloseButton(),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return _buildTitle1();
                  case 1:
                    return _buildFollowedGrid();
                  case 2:
                    return _buildTitle2();
                  case 3:
                    return _buildUnFollowedGrid();
                }
              }),
        ));
  }

  Widget _buildTitle1() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '已订阅频道',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(''),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                onPressed: () {
                  setState(() {
                    _canDrag = !_canDrag;
                  });
                },
                child: Text(_canDrag ? "完成" : '删除/排序',
                    style: TextStyle(fontSize: 13.0, color: Colors.black)),
              ),
            ))
          ],
        ),
        Container(
          height: 10.0,
        )
      ],
    );
  }

  Widget _buildTitle2() {
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
        ),
        Row(
          children: <Widget>[
            Text(
              '未订阅频道',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 15.0,
        ),
      ],
    );
  }

  Widget _buildFollowedGrid() {
    return Container(
      child: SortableGridView(
        widget.followList,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 2.5,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        canAccept: (oldIndex, newIndex) {
          print('newIndex: $newIndex canAccept oldIndex: $oldIndex');
          return newIndex != 0 && oldIndex != 0;
        },
        onDragStarted: () {
          setState(() {
            _canDrag = true;
          });
        },
        itemBuilder: (context, data) {
          return GestureDetector(
              onTap: () {
                if (_canDrag && widget.followList.indexOf(data) != 0) {
                  setState(() {
                    widget.followList.remove(data);
                    widget.unFollowList.add(data);
                  });
                }
              },
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Card(
                      color: Color(0xFFf5f7f9),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Center(
                            child: Text(
                              data.channel_name,
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: _canDrag && widget.followList.indexOf(data) != 0
                        ? Icon(Icons.close)
                        : null,
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget _buildUnFollowedGrid() {
    return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 3.0,
      crossAxisCount: 3,
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 3.0,
      scrollDirection: Axis.vertical,
      children: widget.unFollowList.map((ChannelBean data) {
        return Card(
            color: Color(0xfff5f7f9),
            child: CupertinoButton(
              onPressed: () {
                setState(() {
                  widget.unFollowList.remove(data);
                  widget.followList.add(data);
                });
              },
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Center(
                child: Text("+ ${data.channel_name}",
                    style: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
            ));
      }).toList(),
    );
  }
}
