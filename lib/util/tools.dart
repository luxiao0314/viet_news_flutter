import 'dart:async';
import 'package:dio/dio.dart';
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

void print3(String title, String method, String header, dynamic params,
    dynamic response, bool status) {
  String statusStr;
  String commentResult;
  if (status) {
    statusStr = "✅成功✅";
    commentResult = "成功";
  } else {
    statusStr = "❌失败❌";
    commentResult = "失败";
  }
  print("\n|-------------------- 请求开始 --------------------"
      "\n|请求状态: $statusStr"
      "\n"
      "|\n"
      "|请求接口: $title"
      "\n"
      "|请求头: $header"
      "\n"
      "|请求类型: $method"
      "\n"
      "|请求参数: $params"
      "\n");
  print("请求$commentResult: \n ${_formatJson(response.data.toString())}"
      "\n|");
  print("\n|-------------------- 请求结束 --------------------");
}

const String methodChannelName = "com.mw.viet_flutter_news/channel";
const String channel_getStatusBarHeight = "getStatusBarHeight";

String _formatJson(String jsonStr) {
  if (jsonStr.isEmpty) {
    return "";
  }
  String str = "";
  var last = '\0';
  var current = '\0';
  int indent = 0;
  bool isInQuotationMarks = false;
  for (int i = 0; i < jsonStr.length; i++) {
    last = current;
    current = jsonStr[i];
    switch (current) {
      case '"':
        if (last != '\\') {
          isInQuotationMarks = !isInQuotationMarks;
        }
        str = str + current;
        break;
      case '{':
      case '[':
        str = str + current;
        if (!isInQuotationMarks) {
          str = str + "\n";
          indent++;
          str = _addIndentBlank(str, indent);
        }
        break;
      case '}':
      case ']':
        if (!isInQuotationMarks) {
          str = str + "\n";
          indent--;
          str = _addIndentBlank(str, indent);
        }
        str = str + current;
        break;
      case ',':
        str = str + current;
        if (last != '\\' && !isInQuotationMarks) {
          str = str + "\n";
          str = _addIndentBlank(str, indent);
        }
        break;
      default:
        str = str + current;
    }
  }

  return str;
}

String _addIndentBlank(String str, int indent) {
  for (int i = 0; i < indent; i++) {
    str = str + "\t";
  }
  return str;
}
