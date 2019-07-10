import 'package:flutter/material.dart';

import 'list_view_widget.dart';

///加载中dialog

class ListDialog extends Dialog {
  ListDialog({Key key, this.datas, this.callback}) : super(key: key);
  final List datas;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型(dialog的半透明效果)
        child: Center(
          child: SizedBox(
            width: 300.0,
            height: 500.0,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: ListViewWidget(
                datas: datas,
                width: 300,
                height: 500,
                callback: callback,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
