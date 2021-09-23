import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_project/src/models/scan_model.dart';
export 'package:qr_project/src/models/scan_model.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();

      return _database;
    }
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Scans('
            'id INTEGER PRIMARY KEY,'
            'type TEXT,'
            'value TEXT'
            ')');
      },
    );
  }

  //CREATE registers
  /*newScanRaw(ScanModel newScan) async {
    final db = await database;

    final res = await db.rawInsert("INSTERT Into Scans ('
        'id,'
        'type,'
        'value'
        ') "
        "VALUES ('
        '${newScan.id},'
        '${newScan.type},'
        '${newScan.value}");

    return res;
  }*/

  newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  //SELECT registers
  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<List<ScanModel>> getAllScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'value = ?', whereArgs: [type]);

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  //Update registers
  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;

    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  //Delete registers
  Future<int> deleteScan(int id) async {
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;

    final res = await db.delete('Scans');

    return res;
  }
}
