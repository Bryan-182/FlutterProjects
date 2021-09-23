import 'package:designs_app/src/pages/launcher_page.dart';
import 'package:designs_app/src/themes/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (BuildContext context) => new ThemeChanger(1),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: appTheme,
      title: 'Material App',
      home: LauncherPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
