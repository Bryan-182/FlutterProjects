import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow/src/widgets/slide_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow())
        ]),
      ),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShowWidget(
      activeSize: 15,
      desactiveSize: 10,
      slides: [
        SvgPicture.asset('assets/svgs/slide_1.svg'),
        SvgPicture.asset('assets/svgs/slide_2.svg'),
        SvgPicture.asset('assets/svgs/slide_3.svg'),
        SvgPicture.asset('assets/svgs/slide_4.svg'),
      ],
    );
  }
}
