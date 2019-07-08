import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ui/widget/app_bar.dart';

import 'head_portrait.dart';
import 'income_widget.dart';
import 'mange_item_widget.dart';

///个人中心

class PersonalCenter extends StatelessWidget {
  final Radius radius = Radius.circular(100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        isBack: false,
        iconRight: Icons.format_align_center,
        showIconRight: true,
        iconRight2: Icons.message,
        showIconRight2: true,
        onPressed: () {
//          NavigatorUtils.push(context, LoginRouter.authCodePage);
        },
      ),
      body: new Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        //全屏图片
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(radius),
              border: Border.all(width: 1.0, color: Colors.white),
            ),
            child: Image.asset(
              'assets/images/person_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
//                height: 200,
//                width: 360,
                margin: const EdgeInsets.only(top: 30.0),
                alignment: Alignment.topCenter,
//            child: Padding(
//              padding: const EdgeInsets.only(
//                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                child: IncomeColumnWidget(),
//            ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: ManageColumnWidget(),
              )
            ],
          ),
          Positioned(
            bottom: 50,
            child: Container(
//              margin: const EdgeInsets.only(bottom: 50),
//              alignment: Alignment.bottomCenter,
              child: HeadPortrait(),
            ),
          ),
        ],
      ),
    );
  }
}
