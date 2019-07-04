import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/animator/photohero.dart';

class HeroAnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0; //1.0 means normal animation speed.

    return new Scaffold(
      body: new Container(
        alignment: Alignment.topCenter,
        child: PhotoHeroWidget(
          photo: 'images/main_login_bg.jpg',
          height: 300.0,
          width: double.infinity,
          onTap: () {
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) {
                return new Scaffold(
                  body: new Container(
                    color: Colors.lightBlueAccent,
                    alignment: Alignment.topCenter,
                    child: new PhotoHeroWidget(
                      photo: 'images/main_login_bg.jpg',
                      width: double.infinity,
                      onTap: null,
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
