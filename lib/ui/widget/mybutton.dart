import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/res/colors.dart';

class MyButton extends StatelessWidget {
  MyButton({Key key, this.text, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colours.app_main,
      disabledTextColor: Colours.login_button_disabled,
      disabledColor: Colours.login_text_disabled,
      child: Column(
        children: <Widget>[
          Container(
            height: 48.0,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  final String text;
  final VoidCallback onPressed;
}
