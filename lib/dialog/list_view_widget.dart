import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColumnState();

  final String title;
  final bool showTitle;
  final List datas;
  final bool oneBtn;
  final Alignment itemAlign;
  final double width;
  final double height;
  final VoidCallback callback;

  ListViewWidget(
      {Key key,
      this.title: "",
      this.showTitle: false,
      this.datas,
      this.oneBtn: false,
      this.itemAlign: Alignment.center,
      this.width,
      this.height,
      this.callback})
      : super(key: key);
}

class ColumnState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTitle("取消", context),
        Expanded(
            child: Container(
          width: widget.width,
          height: widget.height,
          child: _buildSuggestion(),
        )),
      ],
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
//      padding: const EdgeInsets.all(16.0),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
//        if (i.isOdd) {
//          return Divider();
//        }
//        // i ~/ 2 表示i除以2，但返回值是整形（向下取整），比如i为 1，2，3，4时  结果分别为 0，1，1，2，这可以计算出ListView中减去分隔线后的实际单词对数量
//        final index = i / 2;
//        //如果是建议列表中的最后一个单词对
//        if (index >= widget.datas.length) {
//          widget.datas.addAll(widget.datas.take(5));
//        }
        return buildItemWithDivider(widget.datas[i]);
      },
      itemCount: widget.datas.length,
    );
  }

  Widget buildTitle(String title, BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.centerLeft,
//        width: double.infinity,
      margin: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: widget.callback,
        child: Text(
          title == null || title.isEmpty ? "取消" : title,
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
//          color: Colors.red,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
    );
  }

  ///列表item and 分割线<Widget>[]
  Widget buildItemWithDivider(String suggestion) {
    return Container(
        alignment: widget.itemAlign,
        height: 64,
        child: SizedBox(
          child: Text(
            suggestion,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        decoration: BoxDecoration(
//          color: Colors.yellow,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.2),
          ),
        ));
  }

  Widget _buildRow(TextStyle _biggerFont, String suggestion) {
    return new ListTile(
      title: Text(
        suggestion,
        style: _biggerFont,
      ),
    );
  }
}
