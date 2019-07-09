import 'package:flutter/material.dart';

///加载中dialog

class ButtonDialog extends Dialog {
  final VoidCallback cancel;
  final VoidCallback confirm;
  final bool showRightBtn;
  final String content;
  final String leftText;
  final String rightText;

  ButtonDialog(
      {Key key,
      this.cancel,
      this.confirm,
      this.showRightBtn: true,
      @required this.content,
      this.leftText: "取消",
      this.rightText: "确定"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型(dialog的半透明效果)
        child: Center(
          child: Container(
//            height: MediaQuery.of(context).size.width * 0.3,
//            width: MediaQuery.of(context).size.height * 0.6,
              height: 200,
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      decoration: ShapeDecoration(
                          shape: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                    ),
                  ),
                  showRightBtn
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: buttonText(leftText, context, cancel),
                            ),
                            Expanded(
                              child: Offstage(
                                offstage: !showRightBtn,
                                child: buttonText(rightText, context, confirm),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: GestureDetector(
                            onTap: cancel,
                            child: Container(
                              height: 64,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                leftText,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                ],
              )),
        ),
      ),
    );
  }

  Widget buttonText(
      String content, BuildContext context, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 64,
        alignment: Alignment.center,
        child: Text(
          content,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey, width: 0.5))),
      ),
    );
  }
}
