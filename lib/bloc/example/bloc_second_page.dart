import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/example/bloc_count_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

//void main() => runApp(CountSecondPage());

class CountSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
          child: CounterPage(),
        ),
      ),
//      home: CounterPage(),
    );
  }
}
