import 'package:flutter/material.dart';
import 'package:qr_project/src/bloc/scans_bloc.dart';
import 'package:qr_project/src/models/scan_model.dart';
import 'package:qr_project/src/pages/maps_page.dart';

import 'address_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => scansBloc.deleteAllScans(),
          )
        ],
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: _createNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _createFloatingButton(),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return MapsPage();
        break;
      case 1:
        return AddressPage();
        break;
      default:
        return MapsPage();
        break;
    }
  }

  Widget _createNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Direcciones',
        ),
      ],
    );
  }

  Widget _createFloatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: _scanQR,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _scanQR() async {
    //https://www.google.com
    //geo:4.5403561,-74.0849478

    String futureString = 'https://www.google.com';

    /*try {
      futureString = (await BarcodeScanner.scan()) as String;
    } catch (e) {
      futureString = e.toString();
    }

    print('Future String $futureString');*/

    if (futureString != null) {
      final scan = ScanModel(value: futureString);
      scansBloc.addScans(scan);

      final scan2 = ScanModel(value: 'geo:4.5403561,-74.0849478');
      scansBloc.addScans(scan2);
    }
  }
}
