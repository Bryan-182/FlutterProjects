import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(
      fontSize: 18, color: Colors.grey, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _createImage(),
          _createTitle(),
          _createButtons(),
          _createText(),
          _createText(),
          _createText(),
          _createText(),
          _createText(),
          _createText(),
        ],
      ),
    ));
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max'),
    );
  }

  Widget _createTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Paisaje', style: titleStyle),
                SizedBox(height: 7),
                Text('Rio, arboles y montañas', style: subtitleStyle),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 30,
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _createButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _createAction(Icons.call, 'CALL'),
          _createAction(Icons.near_me, 'ROUTE'),
          _createAction(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget _createAction(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 40,
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _createText() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          textAlign: TextAlign.justify,
        ));
  }
}
