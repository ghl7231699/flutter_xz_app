import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bloc/top_page.dart';

import 'bloc_provider.dart';

void main() => runApp(MyApp());

///scoped 入口
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'scoped',
        theme: ThemeData.dark(),
        home: TopPage(),
      ),
    );
  }
}
