import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viet_news_flutter/bean/ContentListResponse.dart';

const String URL = 'url';
const String TITLE = 'title';

/// 保存要跳转到WebView的URL 和 title
Future saveWebDetailPresference(String url, String title) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(URL, url);
  preferences.setString(TITLE, title);
}

/// 获取保存在ShrarePreference的URL 和 title
Future<List<String>> getWebDetailPreference() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String url = preferences.getString(URL);
  String title = preferences.getString(TITLE);
  return [url, title];
}

void print2(String title, dynamic content) {
  print("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ $title ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓");
  print(content);
  print("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ $title ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑");
}

void print3(
    String title,
    String method,
    dynamic params, dynamic response, bool status) {
  String statusStr;
  String commentResult;
  if (status) {
    statusStr = "✅成功✅";
    commentResult = "成功";
  } else {
    statusStr = "❌失败❌";
    commentResult = "失败";
  }
  print("\n-------------------- 请求开始 $statusStr --------------------"
        "\n"
        "请求接口: $title"
        "\n"
        "请求类型: $method"
        "\n"
        "请求参数: $params"
        "\n"
        "$commentResult: ${response.toString()}");
}

const String methodChannelName = "com.mw.viet_flutter_news/channel";
const String channel_getStatusBarHeight = "getStatusBarHeight";