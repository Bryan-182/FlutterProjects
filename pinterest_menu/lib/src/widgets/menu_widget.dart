import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class MenuWidget extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;

  MenuWidget(
      {required this.items,
      this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.red,
      this.inactiveColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: AnimatedOpacity(
          opacity: (show) ? 1 : 0,
          duration: Duration(milliseconds: 250),
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_MenuModel>(context).backgroundColor =
                  this.backgroundColor;
              Provider.of<_MenuModel>(context).activeColor = this.activeColor;
              Provider.of<_MenuModel>(context).inactiveColor =
                  this.inactiveColor;

              return _PinteresMenuBackground(
                child: _MenuItems(items),
              );
            },
          ),
        ));
  }
}

class _PinteresMenuBackground extends StatelessWidget {
  final Widget child;

  _PinteresMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;

    final Color color = (index == selectedItem)
        ? Provider.of<_MenuModel>(context).activeColor
        : Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
          item.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Icon(
            item.icon,
            size: (index == selectedItem) ? 30 : 25,
            color: color,
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.red;
  Color inactiveColor = Colors.grey;

  int get selectedItem => this._selectedItem;

  set itemSelected(int index) {
    this._selectedItem = index;
    notifyListeners();
  }
}
