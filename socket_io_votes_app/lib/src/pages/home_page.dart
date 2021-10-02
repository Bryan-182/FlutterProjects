import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_votes_app/services/socket_service.dart';
import 'package:socket_io_votes_app/src/models/hero_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Heros> heros = [];

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);

    socketService.socket.on('active-heros', _handleActiveHeros);
    super.initState();
  }

  _handleActiveHeros(dynamic payload) {
    this.heros = (payload as List).map((hero) => Heros.fromMap(hero)).toList();
    setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);

    socketService.socket.off('active-heros');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: socketService.serverStatus == ServerStatus.Online
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.offline_bolt,
                      color: Colors.black,
                    ))
        ],
        title: Text(
          'Heroes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          _ShowGraph(),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: heros.length,
              itemBuilder: (context, index) => _herosTile(heros[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: addNewHero,
      ),
    );
  }

  Widget _herosTile(Heros hero) {
    final socketService = Provider.of<SocketService>(context, listen: false);

    return Dismissible(
      key: Key(hero.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) =>
          socketService.socket.emit('delete-hero', {'id': hero.id}),
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
        onTap: () => socketService.socket.emit('vote-hero', {'id': hero.id}),
      ),
    );
  }

  addNewHero() {
    final textEditingController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (_) => AlertDialog(
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
              ));
    } else {
      showCupertinoDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
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
              ));
    }
  }

  void addHeroToList(String name) {
    final socketService = Provider.of<SocketService>(context, listen: false);
    if (name.length > 1) {
      socketService.socket.emit('add-hero', {'name': name});
    }
    Navigator.pop(context);
  }

  Widget _ShowGraph() {
    Map<String, double> dataMap = new Map();

    heros.forEach((hero) {
      dataMap.putIfAbsent(hero.name, () => hero.votes.toDouble());
    });

    final List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
    ];
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 50,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 20,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
}
