import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PhotoHeroWidget extends StatelessWidget {
  const PhotoHeroWidget(
      {Key key, this.photo, this.onTap, this.width, this.height})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: width,
      height: height,
      child: new Hero(
        tag: photo,
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(
            onTap: onTap,
            child: new Image.asset(
              photo,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
