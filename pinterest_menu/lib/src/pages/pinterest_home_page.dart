import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_menu/src/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              _PinterestGrid(),
              _MenuLocation(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
      bottom: 30,
      child: Container(
        width: width,
        child: Align(
          child: MenuWidget(
            show: show,
            items: [
              PinterestButton(
                  onPressed: () => print('Icon pie_chart'),
                  icon: Icons.pie_chart),
              PinterestButton(
                  onPressed: () => print('Icon search'), icon: Icons.search),
              PinterestButton(
                  onPressed: () => print('Icon notifications'),
                  icon: Icons.notifications),
              PinterestButton(
                  onPressed: () => print('Icon supervised_user_circle'),
                  icon: Icons.supervised_user_circle),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController scrollController = new ScrollController();
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      (scrollController.position.userScrollDirection == ScrollDirection.reverse)
          ? Provider.of<_MenuModel>(context, listen: false).show = false
          : Provider.of<_MenuModel>(context, listen: false).show = true;

      lastOffset = scrollController.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool show) {
    this._show = show;
    notifyListeners();
  }
}
