import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_votes_app/src/models/hero_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Heros> heros = [
    Heros(id: '1', name: 'Spider-man', votes: 5),
    Heros(id: '2', name: 'Iron Man', votes: 3),
    Heros(id: '3', name: 'Capitán América', votes: 5),
    Heros(id: '4', name: 'Hulk', votes: 1),
    Heros(id: '5', name: 'Thor', votes: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Heroes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: heros.length,
        itemBuilder: (context, index) => _herosTile(heros[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: addNewHero,
      ),
    );
  }

  Widget _herosTile(Heros hero) {
    return Dismissible(
      key: Key(hero.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('Delete: ${hero.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete hero',
            style: TextStyle(color: Colors.white),
          ),
        ),
        color: Colors.red,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(hero.name.substring(0, 2)),
          backgroundColor: Colors.red,
        ),
        title: Text(hero.name),
        trailing: Text(
          '${hero.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () => print('${hero.name}'),
      ),
    );
  }

  addNewHero() {
    final textEditingController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Hero'),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              MaterialButton(
                child: Text('Add'),
                elevation: 5,
                color: Colors.red,
                onPressed: () => addHeroToList(textEditingController.text),
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('New Hero'),
            content: CupertinoTextField(
              controller: textEditingController,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Add'),
                onPressed: () => addHeroToList(textEditingController.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Dismiss'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        },
      );
    }
  }

  void addHeroToList(String name) {
    if (name.length > 1) {
      this
          .heros
          .add(Heros(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
