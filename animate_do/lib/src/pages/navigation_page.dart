import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification Page'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notificationModel =
            Provider.of<_NotificationModel>(context, listen: false);

        int number = notificationModel.number;
        number++;
        notificationModel.number = number;

        if (number >= 2) {
          final controller =
              notificationModel.bounceController.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.red,
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numberOfNotification =
        Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.red,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          icon: Stack(children: [
            FaIcon(FontAwesomeIcons.bell),
            Positioned(
              right: 0,
              //child: Icon(Icons.brightness_1, size: 10, color: Colors.redAccent,),
              child: _NotificationContainer(
                  numberOfNotification: numberOfNotification),
            ),
          ]),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My pet',
        ),
      ],
    );
  }
}

class _NotificationContainer extends StatelessWidget {
  const _NotificationContainer({required this.numberOfNotification});

  final int numberOfNotification;

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      from: 10,
      animate: (numberOfNotification > 0) ? true : false,
      child: Bounce(
        from: 10,
        controller: (controller) => Provider.of<_NotificationModel>(context)
            .bounceController = controller,
        child: Container(
          child: Text(
            ('$numberOfNotification'),
            style: TextStyle(color: Colors.white, fontSize: 7),
          ),
          alignment: Alignment.center,
          width: 12,
          height: 12,
          decoration:
              BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceController;

  int get number => this._number;

  set number(int number) {
    this._number = number;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
