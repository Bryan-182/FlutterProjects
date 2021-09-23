import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  String nombre;

  AlertPage({
    Key key,
    this.nombre,
  }) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Alert')),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              showAlert(context);
            },
            child: Text('Mostrar alerta'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Confirmar'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
