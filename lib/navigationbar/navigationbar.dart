import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/page/page_article.dart';

import '../home.dart';
import '../listview.dart';
import '../person.dart';

/// 带底部tab的widget
class NavigationBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new NavigationState();
}

class NavigationState extends State<NavigationBarWidget> {
  var _currentIndex = 0;
  final PageController _controller = PageController();
  static const TextStyle _styleNormal = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey);
  static const TextStyle _style = TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.blue);
  static const List<Widget> widgets = <Widget>[
    Center(
      child: Text(
        '我是首页',
        style: _style,
      ),
    ),
    Center(
        child: Text(
      '我是项目',
      style: _style,
    )),
    Center(
        child: Text(
      '我是体系',
      style: _style,
    )),
    Center(
        child: Text(
      '我是导航',
      style: _style,
    )),
  ];

  @override
  void initState() {
    //开启状态栏虚拟按键
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);

//    Navigator.pop(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: _onPageChanged,
//        children: widgets,
        children: <Widget>[
          new Home(),
          new ArticlePage(),
          new ListViewApp(),
          new HomePage(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14.0,
        selectedItemColor: Colors.blue,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: Text(
                "首页",
                style: _currentIndex == 0 ? _style : _styleNormal,
              ),
              activeIcon: new Icon(
                Icons.home,
                color: Colors.blue,
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.school,
                color: Colors.grey,
              ),
              title: Text(
                "项目",
                style: _currentIndex == 1 ? _style : _styleNormal,
              ),
              activeIcon: new Icon(
                Icons.school,
                color: Colors.blue,
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.format_indent_decrease,
                color: Colors.grey,
              ),
              title: Text(
                "体系",
                style: _currentIndex == 2 ? _style : _styleNormal,
              ),
              activeIcon: new Icon(
                Icons.format_indent_decrease,
                color: Colors.blue,
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.picture_in_picture_alt,
                color: Colors.grey,
              ),
              title: Text(
                "导航",
                style: _currentIndex == 3 ? _style : _styleNormal,
              ),
              activeIcon: new Icon(
                Icons.picture_in_picture_alt,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _controller.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
//      _controller.jumpToPage(index);
      _currentIndex = index;
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
