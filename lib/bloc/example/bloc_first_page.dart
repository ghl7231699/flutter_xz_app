import 'package:flutter/material.dart';
import 'package:flutter_app/dialog/show_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<CounterBloc>(
        builder: (context) => CounterBloc(),
        child: AppWidget(),
//        child: Text(data),
      ),
//      home: AppWidget(),
    );
  }
}

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: BlocBuilder(
          bloc: _counterBloc,
          builder: (BuildContext context, int count) {
            return Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_counterBloc.currentState}',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(top: 50.0),
                    child: RaisedButton(
                      child: Text('跳转第二页'),
                      onPressed: () {
//                        _counterBloc.dispatch(CounterEvent.increment);
//
//                        Navigator.of(context).push(MaterialPageRoute(
//                            builder: (context) => CountSecondPage()));

//                        LoadingDialog
//                        showDialog(
//                          context: context,
//                          barrierDismissible: true,
//                          builder: (BuildContext context) {
//                            return ButtonDialog(
//                              content: "这是我的第一个dialog弹框",
//                              cancel: () {
//                                Navigator.of(context).pop();
//                              },
//                              showRightBtn: true,
//                              confirm: () {
//                                Navigator.of(context).pop();
//                              },
//                            );
//                          },
//                        );

                        showColumnDialog(
                          context,
                          () {
                            Navigator.of(context).pop();
                          },
                        );
//                        showBottomDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
