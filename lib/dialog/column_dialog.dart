import 'package:flutter/material.dart';

import 'list_view_widget.dart';

///列表类型的dialog

class ColumnDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColumnState();

  final String title;
  final bool showTitle;
  final List datas;
  final bool oneBtn;
  final Alignment itemAlign;

  ColumnDialog(
      {Key key,
      this.title: "",
      this.showTitle: false,
      this.datas,
      this.oneBtn: false,
      this.itemAlign})
      : super(key: key);
}

class ColumnState extends State<ColumnDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20.0,
      content: Expanded(child: null),
    );
  }
}
