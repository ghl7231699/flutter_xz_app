import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/utils/image_utils.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rxdart/rxdart.dart';

///自定义TextField

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final FocusNode focusNode;
  final bool isInputPwd;
  final Function getVCode;
  final KeyboardActionsConfig config;

  const MyTextField(
      {Key key,
      @required this.controller,
      this.maxLength: 16,
      this.autoFocus: false,
      this.keyboardType: TextInputType.text,
      this.hintText: "",
      this.focusNode,
      this.isInputPwd: false,
      this.getVCode,
      this.config})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _showPwd = false;
  bool _showDelete = true;
  bool _click = true;
  StreamSubscription _subscription;

  ///倒计时获取验证码时间
  final second = 60;

  ///当前秒数
  int now;

  @override
  void initState() {
    super.initState();
    //监听输入变化
    widget.controller.addListener(() {
      setState(() {
        _showDelete = widget.controller.text.isEmpty;
      });
    });
    if (widget.config != null && defaultTargetPlatform == TargetPlatform.iOS) {
      // 因Android平台输入法兼容问题，所以只配置IOS平台
      FormKeyboardActions.setKeyboardActions(context, widget.config);
    }
  }

  dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  initTextFieldListener() => {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          //是否用于隐藏正在编辑的文本（比如说输入密码）
          obscureText: widget.isInputPwd ? !_showPwd : false,
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          keyboardType: widget.keyboardType,
          //数字、手机号限制格式为0-9（白名单），密码限制不包含汉字（黑名单）
          inputFormatters: (widget.keyboardType == TextInputType.number ||
                  widget.keyboardType == TextInputType.phone)
              ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
              : [BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
            hintText: widget.hintText,
            counterText: "",
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colours.app_main, width: 0.8)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colours.line, width: 0.8)),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: !widget.isInputPwd,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _showPwd = !_showPwd;
                    });
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: loadAssetImage(
                    _showPwd ? "icon_hide" : 'icon_display',
                    width: 18.0,
                    height: 18.0,
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: _showDelete,
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.controller.text = "";
                  });
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: loadAssetImage(
                  "icon_delete",
                  width: 18.0,
                  height: 18.0,
                ),
              ),
            ),
            //获取验证码
            Offstage(
              offstage: widget.getVCode == null,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 76.0,
                  height: 26.0,
                  child: FlatButton(
                    onPressed: _click
                        ? () {
                            widget.getVCode();
                            setState(() {
                              now = second;
                              _click = false;
                            });
                            _subscription = Observable.periodic(
                                    Duration(seconds: 1), (time) => time)
                                .take(second)
                                .listen((time) {
                              setState(() {
                                now = second - 1 - time;
                                _click = now < 1;
                              });
                            });
                          }
                        : null,
                    padding:
                        const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                    textColor: Colours.app_main,
                    color: Colors.transparent,
                    disabledColor: Colors.white,
                    disabledTextColor: Colours.text_gray_c,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                        side: BorderSide(
                          color:
                              _click ? Colours.app_main : Colours.text_gray_c,
                          width: 0.8,
                        )),
                    child: Text(
                      _click ? '获取验证码' : "$now s",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
