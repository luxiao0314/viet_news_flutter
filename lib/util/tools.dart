import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

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
  print("-------------Start $title-------------");
  print(content);
  print("-------------End $title-------------");
}