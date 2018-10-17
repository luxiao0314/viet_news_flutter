import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../util/tools.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({this.url, this.title});
  final String url;
  final String title;
  _WebViewPageState createState() => _WebViewPageState();
}
class _WebViewPageState extends State<WebViewPage> {

  final webView = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      url: widget.url,
      withZoom: true,
    );
  }
}
