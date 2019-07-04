import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "我的",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("个人中心"),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            getTitle(),
            getButton(context),
            getTextSection(context)
          ],
        ),
      ),
    );
  }

  ///生成第一行
  Widget getTitle() {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "我的名字叫麦克",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                "中国人名解放军",
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[500]),
              )
            ],
          )),
//          new Icon(
//            Icons.star,
//            color: Colors.red,
//          ),
//          new Text("特种兵")
          new FavoriteWidget()
        ],
      ),
    );
    return titleSection;
  }

  Widget getButton(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(context, Icons.call, "电话"),
          buildButtonColumn(context, Icons.near_me, "附近"),
          buildButtonColumn(context, Icons.share, "分享"),
        ],
      ),
    );
  }

  Column buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          margin: EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
                fontSize: 12.0, color: color, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget getTextSection(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
          "我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文"),
    );
  }
}

///自定义statefulWidget 就实现这一个方法就行
///
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteNum = 41;

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorite
                  ? new Icon(Icons.favorite)
                  : new Icon(Icons.favorite_border)),
              color: Colors.red,
              onPressed: onClick),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text(
              '$_favoriteNum',
              style: new TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }

  void onClick() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _favoriteNum -= 1;
      } else {
        _isFavorite = true;
        _favoriteNum += 1;
      }
    });
  }
}
