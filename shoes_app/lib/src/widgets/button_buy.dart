import 'package:flutter/material.dart';

class ButtonBuy extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final color;

  ButtonBuy(
      {required this.text,
      this.height = 45,
      this.width = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
