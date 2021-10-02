import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_votes_app/services/socket_service.dart';
import 'package:socket_io_votes_app/src/pages/home_page.dart';
import 'package:socket_io_votes_app/src/pages/status_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SocketService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(primaryColor: Colors.red),
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'status': (_) => StatusPage(),
        },
      ),
    );
  }
}
