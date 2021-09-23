import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              this.activate = true;
            });
          },
          backgroundColor: Colors.white,
          child: FaIcon(
            FontAwesomeIcons.play,
            color: Color(0xff1da1f2),
          ),
        ),
        backgroundColor: Color(0xff1da1f2),
        body: Center(
          child: ZoomOut(
            animate: activate,
            from: 30,
            duration: Duration(seconds: 1),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 50,
            ),
          ),
        ));
  }
}
