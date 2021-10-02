import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_votes_app/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ServerStatus:  ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          socketService.socket.emit('mensaje', 'Mensaje desde telefono');
        },
      ),
    );
  }
}
