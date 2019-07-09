import 'package:flutter/material.dart';

///加载中dialog

class LoadingDialog extends Dialog {
  LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型(dialog的半透明效果)
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      '加载中',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
