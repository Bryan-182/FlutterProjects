import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.cyan;

  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: _borderRadiusGeometry,
          color: _color,
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _shapeChange();
        },
      ),
    );
  }

  void _shapeChange() {
    final random = Random();

    setState(() {
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      _borderRadiusGeometry =
          BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
