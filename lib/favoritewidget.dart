import 'package:flutter/material.dart';

///自定义statefulWidget 就实现这一个方法就行
///
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteWidget> {
  FavoriteState({Key key, this.active: false, @required this.values});

  final bool active;
  final ValueChanged<bool> values;
  bool _isFavorite = true;

  void _handleTap() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
    values(!active);
  }

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
              onPressed: _handleTap),
        )
      ],
    );
  }

}
