import 'package:flutter/material.dart';

import 'list_dialog.dart';
import 'list_view_widget.dart';

///example
void showColumnDialog(BuildContext context, VoidCallback callback,
    {int width, int height}) {
  List<String> a = [
    '111',
    '2222',
    '33333',
    '44444',
    '55555',
    '55555',
    '55555',
    '55555'
  ];
  showDialog(
    context: context,
    builder: (context) {
      return ListDialog(
        callback: callback,
        datas: a,
      );
    },
  );
}

void showBottomDialog(BuildContext context) {
  List<String> a = [
    '111',
    '2222',
    '33333',
    '44444',
    '55555',
    '55555',
    '55555',
    '55555'
  ];
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListViewWidget(
          datas: a,
        );
      });
}
