import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_providers.dart';
import 'package:flutter_components/src/utils/icons_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //print(menuProvider.options);

    //menuProvider.loadData()

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _itemList(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.cyan,
        ),
        onTap: () {
          /*final route = MaterialPageRoute(builder: (context) => AlertPage());

          Navigator.push(context, route);*/

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
