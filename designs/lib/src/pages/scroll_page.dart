import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _pageOne(),
        _pageTwo(),
      ],
    ));
  }

  Widget _pageOne() {
    return Stack(
      children: <Widget>[
        _backgroundColor(),
        _backgroundImage(),
        _createTexts(),
      ],
    );
  }

  Widget _backgroundColor() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(108, 192, 218, 1));
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createTexts() {
    final textStyle = TextStyle(color: Colors.white, fontSize: 50);

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Text('11°', style: textStyle),
          Text('Miercoles', style: textStyle),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white),
        ],
      ),
    );
  }

  Widget _pageTwo() {
    return Stack(
      children: <Widget>[
        _backgroundColor(),
        _createButton(),
      ],
    );
  }

  Widget _createButton() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
