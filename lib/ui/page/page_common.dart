import 'package:flutter/material.dart';

class PageCommonWidget extends StatelessWidget {
//  final itemData;
//
//  PageSearchWidget(this.itemData);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "常用网站",
          style: new TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
