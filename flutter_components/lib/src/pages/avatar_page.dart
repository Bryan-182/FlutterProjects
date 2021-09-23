import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.plymouth.edu/theclock/wp-content/uploads/sites/183/2019/03/stan-lee.png'),
                radius: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.white,
              ),
            )
          ],
          title: Text('Avatar Page'),
        ),
        body: Center(
            child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://hipertextual.com/files/2019/07/hipertextual-marvel-revela-sera-final-universo-marvel-2019314666.jpg'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 250,
                fit: BoxFit.cover)),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
