import 'package:flutter/material.dart';
import 'package:qr_project/src/bloc/scans_bloc.dart';
import 'package:qr_project/src/models/scan_model.dart';

class MapsPage extends StatelessWidget {
  final scansBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          final scans = snapshot.data;
          if (scans.length == 0) {
            return Center(child: Text('No hay registros'));
          } else {
            return _listScans(scans);
          }
        }
      },
    );
  }

  Widget _listScans(List<ScanModel> scans) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red[900],
        ),
        child: ListTile(
          leading: Icon(
            Icons.cloud_queue,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].value),
          subtitle: Text('ID: ${scans[index].id}'),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ),
        onDismissed: (direction) => scansBloc.deleteScan(scans[index].id),
      ),
    );
  }
}
