import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; //1.0 means normal animation speed.
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.white),
      home: new RandomWord(),
    );
  }
}

///StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordState();
}

///
class RandomWordState extends State<RandomWord> {
  final _suggestion = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
//    final word = new WordPair.random();
//    return new Text(word.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("我是一个小列表")),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  /// builder返回一个Scaffold，其中包含名为“Saved Suggestions”的新路由的应用栏。 新路由的body由包含ListTiles行的ListView组成; 每行之间通过一个分隔线分隔。
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final titles = _saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final divided =
              ListTile.divideTiles(context: context, tiles: titles).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text("收藏"),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return Divider();
          }
          // i ~/ 2 表示i除以2，但返回值是整形（向下取整），比如i为 1，2，3，4时  结果分别为 0，1，1，2，这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          //如果是建议列表中的最后一个单词对
          if (index >= _suggestion.length) {
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index]);
        });
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);
    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new FavoriteWidget(),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }

  void handleTap(String tag) {
    switch (tag) {
      case "":
        break;
    }
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteWidget> {
  bool isFavorite = false;

  void _handleTap() {
    setState(() {
      if (isFavorite) {
        isFavorite = false;
      } else {
        isFavorite = true;
      }
    });
  }

  //TODO child widget 点击 通知父widget进行设置 保存是否是最爱
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (isFavorite
                  ? new Icon(Icons.favorite)
                  : new Icon(Icons.favorite_border)),
              color: isFavorite ? Colors.red : null,
              onPressed: _handleTap),
        )
      ],
    );
  }
}
