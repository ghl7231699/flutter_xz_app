import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///个人中心  收入widget
///
/// TODO  调整

class IncomeColumnWidget extends StatefulWidget {
  final String orderNum;
  final String incomeTotal;
  final String bussinessDays;
  final String percent;

  const IncomeColumnWidget(
      {Key key,
      this.orderNum,
      this.incomeTotal,
      this.bussinessDays,
      this.percent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => IncomeColumnState();
}

class IncomeColumnState extends State<IncomeColumnWidget> {
  final Radius radius = Radius.circular(20.0);
  final BorderSide _borderSide = BorderSide(color: Colors.white, width: 1);
  final BorderSide _borderSpecial = BorderSide(color: Colors.black, width: 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 100,
//                width: double.infinity,
              width: 330,
              decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius:
                      BorderRadius.only(topLeft: radius, bottomLeft: radius),
                  border: Border(
                    top: _borderSide,
                    bottom: _borderSide,
                  )),
            ),
            Container(
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: radius, topRight: radius, bottomLeft: radius),
                    border: Border.all(width: 1.0, color: Colors.white)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, top: 10.0, bottom: 10.0),
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.center,
                      child: Container(
                        width: 28,
                        alignment: Alignment.center,
                        child: Text(
                          widget.orderNum == null
                              ? "143单"
                              : widget.orderNum + '单',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: Colors.black, width: 3.0)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, right: 50),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.orderNum == null ? "¥6847" : widget.orderNum,
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                widget.orderNum == null
                                    ? "累积收入·超过85%达人"
                                    : "累积收入·超过${widget.percent}%达人",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 100,
          width: 28,
          alignment: Alignment.center,
          child: Text(
            widget.bussinessDays == null ? "经营106天" : widget.bussinessDays,
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius:
                  BorderRadius.only(topRight: radius, bottomRight: radius),
              border: Border.all(width: 1, color: Color(0xFFF4F4F4))),
        ),
      ],
    );
  }
}
