import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

///WebView widget
///
/// TODO  完善
///
class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebViewState();

  final String title;
  final String url;

  WebViewPage({Key key, @required this.title, @required this.url})
      : super(key: key);
}

class WebViewState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (context, snapshot) {
          return WillPopScope(child: Scaffold(), onWillPop: null);
        });
  }
}
