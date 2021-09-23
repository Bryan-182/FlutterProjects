import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  CardsPage({Key key}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CardsPage'),
        ),
        body: card1(),
      ),
    );
  }

  //container, scaffold
  //column, row, list
  //buttons, text, images, card,

  Widget card1() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Titulo Tarjeta 1'),
            trailing: Icon(Icons.star),
            subtitle: Text('Subtitulo tarjeta 1'),
          ),
          FlutterLogo(),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://image.freepik.com/vector-gratis/avatar-personaje-empresario-aislado_24877-60111.jpg'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
