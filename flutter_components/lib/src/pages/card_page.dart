import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30),
          _cardType2(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.cyan),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(
                'Esta es la prueba del subtitulo de la tarjeta construida con flutter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('Ok'), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250,
            fit: BoxFit.cover,
          ),
          Container(child: Text('Texto'), padding: EdgeInsets.all(10)),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(1, 10)),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
    );
  }
}
