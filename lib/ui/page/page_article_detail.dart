import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailWidget extends StatelessWidget {
  final itemData;

  ArticleDetailWidget(this.itemData);

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: itemData['link'] == null ? itemData['url'] : itemData['link'],
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            itemData['title'],
            style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
