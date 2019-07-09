import 'dart:async';

import 'package:flutter/material.dart';

/// Dart Stream

void main() {
  //创建任意类型的流
//  StreamController controller1 = StreamController();
//  controller1.sink.add('123');
//  controller1.sink.add('china');
////  controller.sink.add(Anything);
//
//  controller1.stream.listen((data) => debugPrint("result is $data"));
//  controller1.sink.add('333355555');
//
//  controller1.close();

  ///猜字游戏

  StreamController<int> controller = StreamController<int>();
  final transform =
      StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
    if (value == 100) {
      sink.add("恭喜你，猜对了！");
    } else {
      sink.addError("猜错了，才来一次吧");
    }
  });

  controller.stream.transform(transform).listen(
      (value) => debugPrint("result is $value"),
      onError: (error) => debugPrint('$error'));

//  controller.sink.add(100);

  controller.close();

  StreamController<int> controller2 = StreamController<int>();
  //将单订阅流转换为广播流
  Stream asBroadcastStream = controller2.stream.asBroadcastStream();
  asBroadcastStream.listen((data) => debugPrint("result is $data"));
  asBroadcastStream.listen((data) => debugPrint("result is $data"));

//  controller2.sink.add(122344);
//  controller2.close();

  ///Future
  ///
  fallInLove(); //谈恋爱；
  handleHouse(); //买房、入住(耗时、费用的操作)
  marry(); //结婚
  haveChild(); //生娃
}

class House {}

Future buyHouse() {
  Future<House> future = Future(() {
    print("buyHouse");
  });
  return future;
}

void livingHouse() {
  print('livingHouse');
}

void marry() {
  print('marry');
}

void haveChild() {
  print('haveChild');
}

void fallInLove() {
  print('fall in love');
}

//进行买房 入住等操作
Future<void> handleHouse() async {
//  Future<House> house = buyHouse();
//  house.then((h) {
//    livingHouse();
//  });
  await buyHouse();
  livingHouse();
}
