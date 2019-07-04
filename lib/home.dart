import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/page_article.dart';

import 'person.dart';
import 'ui/page/page_common.dart';
import 'ui/page/page_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _pushNext(WidgetBuilder builder) {
      Navigator.of(context).push(
        new MaterialPageRoute(builder: builder),
      );
    }

    void onListButtonClick() {
      _pushNext((context) => new HomePage());
    }

    void onSearchButtonClick() {
      _pushNext((context) => new PageSearchWidget());
    }

    void onCommonButtonClick() {
      _pushNext((context) => new PageCommonWidget());
    }

    //个人信息
    Widget leftButton = new IconButton(
        icon: new Icon(Icons.list),
        onPressed: () {
          onListButtonClick();
        });
    //常用网站
    Widget common = new IconButton(
        icon: new Icon(Icons.border_all),
        onPressed: () {
          onCommonButtonClick();
        });
    //搜索
    Widget search = new IconButton(
        icon: new Icon(Icons.search),
        onPressed: () {
          onSearchButtonClick();
        });
    Center title = new Center(
      child: new Text(
        "首页",
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
      ),
    );

    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: title,
        leading: leftButton,
        centerTitle: true,
        actions: <Widget>[common, search],
      ),
      body: new ArticlePage(),
    ));
  }
}
