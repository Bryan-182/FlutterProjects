import 'dart:async';

import 'package:qr_project/src/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    //Obtains scans
    obtainsScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose() {
    _scansController?.close();
  }

  //Obtains all scans
  obtainsScans() async {
    _scansController.sink.add(await DBProvider.db.getAllScans());
  }

  //Add Scans
  addScans(ScanModel scan) async {
    await DBProvider.db.newScan(scan);
    obtainsScans();
  }

  //Delete scans
  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtainsScans();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScan();
    obtainsScans();
  }
}
