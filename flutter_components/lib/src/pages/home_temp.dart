import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Temp'),
        ),
        body: ListView(children: _createItemsShort()));
  }

  /*List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (var opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)..add(Divider());
    }
    return list;
  }*/

  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.accessibility_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
