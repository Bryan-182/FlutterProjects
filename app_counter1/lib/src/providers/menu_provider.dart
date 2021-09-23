import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    //
  }

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('lib/src/data/options.json');

    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
