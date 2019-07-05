import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///个人中心  管理模块
///
/// TODO  调整

class ManageColumnWidget extends StatefulWidget {
  final String orderNum;
  final String incomeTotal;
  final String bussinessDays;
  final String percent;

  const ManageColumnWidget(
      {Key key,
      this.orderNum,
      this.incomeTotal,
      this.bussinessDays,
      this.percent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ManageColumnState();
}

class ManageColumnState extends State<ManageColumnWidget> {
  final Radius radius = Radius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildItem("管理房源"),
        _buildItem("管理游记"),
        _buildItem("学习经验"),
      ],
    );
  }

  Widget _buildItem(
    String title,
  ) {
    return InkWell(
      onTap: null,
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.assignment_ind,
              color: Colors.blue,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: radius, topRight: radius, bottomLeft: radius),
            border: Border.all(width: 1.0, color: Colors.white)),
      ),
    );
  }
}
