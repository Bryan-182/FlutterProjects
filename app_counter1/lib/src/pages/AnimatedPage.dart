import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _height = 50;
  double _width = 50;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedPage'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: _borderRadiusGeometry,
              color: _color,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            animation();
          },
        ),
      ),
    );
  }

  void animation() {
    final random = Random();

    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _borderRadiusGeometry =
          BorderRadius.circular(random.nextInt(300).toDouble());
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }
}
