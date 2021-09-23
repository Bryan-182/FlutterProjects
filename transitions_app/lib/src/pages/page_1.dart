import 'package:flutter/material.dart';
import 'package:transitions_app/src/pages/page_2.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _createRote());
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }

  Route _createRote() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            SecondPage(),
        transitionDuration: Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          /*return SlideTransition(
            position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                .animate(curveAnimation),
            child: child,
          );*/

          /*return ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
            child: child,
          );*/

          /*return RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
            child: child,
          );*/

          return FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
            child: child,
          );
        });
  }
}
