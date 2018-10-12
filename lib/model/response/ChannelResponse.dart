import 'dart:convert' show json;

import 'package:viet_news_flutter/bean/ChannelBean.dart';

class ChannelResponse {
  int code;
  String message;
  List<ChannelBean> data;

  ChannelResponse.fromParams({this.code, this.message, this.data});

  factory ChannelResponse(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ChannelResponse.fromJson(json.decode(jsonStr))
          : new ChannelResponse.fromJson(jsonStr);

  ChannelResponse.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new ChannelBean.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null ? '${json.encode(message)}' : 'null'},"data": $data}';
  }
}
