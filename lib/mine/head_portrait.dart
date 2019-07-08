import 'package:flutter/material.dart';

///个人头像及账号

class HeadPortrait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeadPortraitState();
}

class HeadPortraitState extends State<HeadPortrait> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://img4q.duitang.com/uploads/item/201408/08/20140808171354_XkhfE.jpeg'),
              //如果指定了maxRadius  则不能同时指定radius
//              minRadius: 50.0,
//              maxRadius: 60.0,
              radius: 58,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            '蓝色妖姬',
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '补充抖音和小红书账号',
                  style: TextStyle(color: Color(0xFFE35120), fontSize: 12.0),
                ),
                Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Color(0xFFE35120),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
