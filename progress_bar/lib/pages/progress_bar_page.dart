import 'dart:math';

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  AnimationController animationController;
  TickerProvider tickerProvider;

  double porcentaje = 10;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 10000));

    animationController.addListener(() {
      print('Valor controller: ${animationController.value}');
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          print(porcentaje);
          animationController.forward();
          porcentaje == 100 ? porcentaje = 0 : porcentaje += 10;
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double porcentaje;

  _RadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Draw Arc
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    //Parte que se va llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
