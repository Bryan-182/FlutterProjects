import 'package:dio_app/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Column(
          children: [
            Center(
              child: RaisedButton(
                onPressed: () {
                  _.validarInfo();
                },
                child: Text(_.getUserName()),
              ),
            ),
            _.isDAtosCorrectos ? alerta() : alerta2(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh_outlined),
          onPressed: () => _.refreshUser(),
        ),
      ),
    );
  }

  Widget alerta() {}

  Widget alerta2() {}
}
