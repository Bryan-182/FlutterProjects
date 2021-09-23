import 'package:designs_app/src/widgets/header_widget.dart';
import 'package:designs_app/src/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MainScroll());
  }
}

class MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      ItemMenuButton(
        icon: FontAwesomeIcons.carCrash,
        text: 'Motor Accident',
        firstColor: Color(0xff6989F5),
        secondColor: Color(0xff906EF5),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.plus,
        text: 'Medical Emergency',
        firstColor: Color(0xff66A9F2),
        secondColor: Color(0xff536CF6),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.theaterMasks,
        text: 'Theft / Harrasement',
        firstColor: Color(0xffF2D572),
        secondColor: Color(0xffE06AA3),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.biking,
        text: 'Awards',
        firstColor: Color(0xff317183),
        secondColor: Color(0xff46997D),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.carCrash,
        text: 'Motor Accident',
        firstColor: Color(0xff6989F5),
        secondColor: Color(0xff906EF5),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.plus,
        text: 'Medical Emergency',
        firstColor: Color(0xff66A9F2),
        secondColor: Color(0xff536CF6),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.theaterMasks,
        text: 'Theft / Harrasement',
        firstColor: Color(0xffF2D572),
        secondColor: Color(0xffE06AA3),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.biking,
        text: 'Awards',
        firstColor: Color(0xff317183),
        secondColor: Color(0xff46997D),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.carCrash,
        text: 'Motor Accident',
        firstColor: Color(0xff6989F5),
        secondColor: Color(0xff906EF5),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.plus,
        text: 'Medical Emergency',
        firstColor: Color(0xff66A9F2),
        secondColor: Color(0xff536CF6),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.theaterMasks,
        text: 'Theft / Harrasement',
        firstColor: Color(0xffF2D572),
        secondColor: Color(0xffE06AA3),
        onPress: () => print('Click'),
      ),
      ItemMenuButton(
        icon: FontAwesomeIcons.biking,
        text: 'Awards',
        firstColor: Color(0xff317183),
        secondColor: Color(0xff46997D),
        onPress: () => print('Click'),
      ),
    ];

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                maxHeigth: 300,
                minHeigth: 300,
                child: Container(color: Colors.white, child: _BuildHeader())),
          ),
          SliverList(delegate: SliverChildListDelegate([...items])),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeigth;
  final double minHeigth;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.maxHeigth,
    required this.minHeigth,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeigth;

  @override
  double get minExtent => minHeigth;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeigth != oldDelegate.maxHeigth ||
        minHeigth != oldDelegate.minHeigth ||
        child != oldDelegate.child;
  }
}

class _BuildHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Has solicitado',
          subtitle: 'Asistencia medica',
          colorOne: Color(0xff526BF6),
          colorTwo: Color(0xff67ACF2),
        ),
        Positioned(
            top: 50,
            right: 0,
            child: RawMaterialButton(
              onPressed: () => print('Press Menu'),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
