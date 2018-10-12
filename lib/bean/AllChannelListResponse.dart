import 'dart:convert' show json;

import 'package:viet_news_flutter/bean/ChannelBean.dart';

class ChannelAllListResponse {
  int code;
  String message;
  ChannelAllList data;

  ChannelAllListResponse.fromParams({this.code, this.message, this.data});

  factory ChannelAllListResponse(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ChannelAllListResponse.fromJson(json.decode(jsonStr))
          : new ChannelAllListResponse.fromJson(jsonStr);

  ChannelAllListResponse.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null
        ? null
        : new ChannelAllList.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null ? '${json.encode(message)}' : 'null'},"data": $data}';
  }
}

class ChannelAllList {
  List<ChannelBean> followChannelList;
  List<ChannelBean> unFollowChannelList;

  ChannelAllList.fromParams({this.followChannelList, this.unFollowChannelList});

  ChannelAllList.fromJson(jsonRes) {
    followChannelList = jsonRes['followChannelList'] == null ? null : [];

    for (var followChannelListItem
        in followChannelList == null ? [] : jsonRes['followChannelList']) {
      followChannelList.add(followChannelListItem == null
          ? null
          : new ChannelBean.fromJson(followChannelListItem));
    }

    unFollowChannelList = jsonRes['unFollowChannelList'] == null ? null : [];

    for (var unFollowChannelListItem
        in unFollowChannelList == null ? [] : jsonRes['unFollowChannelList']) {
      unFollowChannelList.add(unFollowChannelListItem == null
          ? null
          : new ChannelBean.fromJson(unFollowChannelListItem));
    }
  }

  @override
  String toString() {
    return '{"followChannelList": $followChannelList,"unFollowChannelList": $unFollowChannelList}';
  }
}

//class ChannelBean {
//
//  int id;
//  int sort;
//  bool can_delete;
//  bool default_channel;
//  bool follow_Status;
//  String channel_key;
//  String channel_name;
//
//  ChannelBean.fromParams({this.id, this.sort, this.can_delete, this.default_channel, this.follow_Status, this.channel_key, this.channel_name});
//
//  ChannelBean.fromJson(jsonRes) {
//    id = jsonRes['id'];
//    sort = jsonRes['sort'];
//    can_delete = jsonRes['can_delete'];
//    default_channel = jsonRes['default_channel'];
//    follow_Status = jsonRes['follow_Status'];
//    channel_key = jsonRes['channel_key'];
//    channel_name = jsonRes['channel_name'];
//  }
//
//  @override
//  String toString() {
//    return '{"id": $id,"sort": $sort,"can_delete": $can_delete,"default_channel": $default_channel,"follow_Status": $follow_Status,"channel_key": ${channel_key != null?'${json.encode(channel_key)}':'null'},"channel_name": ${channel_name != null?'${json.encode(channel_name)}':'null'}}';
//  }
//}
