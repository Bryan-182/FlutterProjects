import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titles(),
                _roundedButtons(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _background() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(52, 54, 101, 1),
          Color.fromRGBO(35, 37, 57, 1),
        ],
        begin: FractionalOffset(0, 0.6),
        end: FractionalOffset(0, 1),
      )),
    );

    final pinkBox = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1),
            Color.fromRGBO(241, 142, 172, 1),
          ]),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: pinkBox,
          top: -100,
        ),
      ],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify Transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedButtons() {
    return Table(
      children: [
        TableRow(children: [
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
        ]),
        TableRow(children: [
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
        ]),
        TableRow(children: [
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
        ]),
        TableRow(children: [
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
          _createRoudedButton(Colors.blue, Icons.border_all, 'General'),
        ]),
      ],
    );
  }

  Widget _createRoudedButton(Color color, IconData icono, String text) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      width: 180.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 40.0,
                child: Icon(icono, color: Colors.white, size: 30.0),
              ),
              Text(
                text,
                style: TextStyle(color: color, fontSize: 18.0),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.pinkAccent,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bubble_chart),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          title: Container(),
        ),
      ],
    );
  }
}
