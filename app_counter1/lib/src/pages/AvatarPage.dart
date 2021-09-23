import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  AvatarPage({Key key}) : super(key: key);

  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AvatarPage'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.freepik.com/vector-gratis/avatar-personaje-empresario-aislado_24877-60111.jpg'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                child: Text('AV'),
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://image.freepik.com/vector-gratis/avatar-personaje-empresario-aislado_24877-60111.jpg'),
            fadeInDuration: Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
