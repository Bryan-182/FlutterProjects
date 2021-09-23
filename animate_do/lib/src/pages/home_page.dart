import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navigation_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Do'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TwitterPage()));
            },
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          FadeInRight(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
              icon: FaIcon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => NavigationPage()));
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
            delay: Duration(seconds: 1),
            child: Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40,
            ),
          ),
          FadeInDown(
            child: Text(
              'Title',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
          ),
          FadeInDown(
            delay: Duration(milliseconds: 1000),
            child: Text(
              'Subtitle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          FadeInLeft(
            child: Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
