import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../util/tools.dart';

class WebViewPage extends StatefulWidget {
  _WebViewPageState createState() => _WebViewPageState();
}
class _WebViewPageState extends State<WebViewPage> {

  String _url;
  String _title;
  final webView = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    getWebDetailPreference().then((values){
      this._url = values[0];
      this._title = values[1];
      print2("url title", [_url, _title]);
      setState(() {
        webView.reloadUrl(_url);
      });
    }, onError: (error) {
      print2("error", error);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(_title == null ? "123123123" : _title),
      ),
      url: _url == null ? "https://www.baidu.com" : _url,
      withZoom: true,
    );
  }
}
