import 'package:flutter/material.dart';

void main() => runApp(CountBlocPage());

class CountBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Text('${snapshot.data}');
        },
      )),
    );
  }
}
