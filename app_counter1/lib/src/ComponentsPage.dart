import 'package:app_counter1/src/providers/menu_provider.dart';
import 'package:app_counter1/src/utils/StringToIcon.dart';
import 'package:flutter/material.dart';

class ComponentsPage extends StatefulWidget {
  ComponentsPage({Key key}) : super(key: key);

  @override
  _ComponentsPageState createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ComponentsPage'),
        ),
        body: list(),
      ),
    );
  }

  Widget list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> response) {
        return ListView(
          children: itemList(response.data, context),
        );
      },
    );
  }

  List<Widget> itemList(List<dynamic> list, BuildContext context) {
    final List<Widget> options = [];

    list.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        trailing: Icon(Icons.keyboard_arrow_right),
        leading: getIcon(opt['icon']),
        onTap: () {
          //String nombre = 'Test';
          /*Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlertPage()));*/
          /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlertPage(
                        nombre: nombre,
                      )));*/
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
