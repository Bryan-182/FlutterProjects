import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {
  final List<Widget> slides;
  final bool indicatorUp;
  final Color activeColor;
  final Color desactiveColor;
  final double activeSize;
  final double desactiveSize;

  SlideShowWidget(
      {required this.slides,
      this.indicatorUp = false,
      this.activeColor = Colors.red,
      this.desactiveColor = Colors.grey,
      this.activeSize = 12,
      this.desactiveSize = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderModel>(context).activeColor = this.activeColor;
              Provider.of<_SliderModel>(context).desactiveColor =
                  this.desactiveColor;
              Provider.of<_SliderModel>(context).activeSize = this.activeSize;
              Provider.of<_SliderModel>(context).desactiveSize =
                  this.desactiveSize;

              return _CreateSlideShow(indicatorUp: indicatorUp, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateSlideShow extends StatelessWidget {
  const _CreateSlideShow({
    Key? key,
    required this.indicatorUp,
    required this.slides,
  }) : super(key: key);

  final bool indicatorUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.indicatorUp) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.indicatorUp) _Dots(this.slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).setCurrentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(50.0),
        child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int numberOfDots;

  _Dots(this.numberOfDots);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.numberOfDots, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<_SliderModel>(context);
    final double size = (sliderModel.getCurrentPage >= index - 0.5 &&
            sliderModel.getCurrentPage < index + 0.5)
        ? sliderModel.activeSize
        : sliderModel.desactiveSize;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: (sliderModel.getCurrentPage >= index - 0.5 &&
                  sliderModel.getCurrentPage < index + 0.5)
              ? sliderModel.activeColor
              : sliderModel.desactiveColor,
          shape: BoxShape.circle),
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _activeColor = Colors.red;
  Color _desactiveColor = Colors.grey;
  double _activeSize = 12;
  double _desactiveSize = 12;

  get getCurrentPage {
    return _currentPage;
  }

  set setCurrentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color color) {
    this._activeColor = color;
  }

  Color get desactiveColor => this._desactiveColor;

  set desactiveColor(Color color) {
    this._desactiveColor = color;
  }

  double get activeSize => this._activeSize;

  set activeSize(double size) {
    this._activeSize = size;
  }

  double get desactiveSize => this._desactiveSize;

  set desactiveSize(double size) {
    this._desactiveSize = size;
  }
}
