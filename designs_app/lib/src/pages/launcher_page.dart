import 'package:designs_app/src/routes/routes.dart';
import 'package:designs_app/src/themes/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuDrawer(),
      body: _OptionList(),
    );
  }
}

class _MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    'BO',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _OptionList(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: Colors.red,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: Colors.red,
                  onChanged: (value) => appTheme.darkTheme = value),
            ),
            SafeArea(
              top: false,
              right: false,
              left: false,
              bottom: true,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: Colors.red,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: Colors.red,
                    onChanged: (value) => appTheme.customTheme = value),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.red,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: Colors.red,
        ),
        title: Text(pageRoutes[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.red,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pageRoutes[i].page),
          );
        },
      ),
    );
  }
}
