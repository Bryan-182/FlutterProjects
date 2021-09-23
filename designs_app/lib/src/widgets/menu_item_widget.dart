import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemMenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color firstColor;
  final Color secondColor;
  final Function() onPress;

  ItemMenuButton({
    required this.icon,
    required this.text,
    this.firstColor = Colors.grey,
    this.secondColor = Colors.blueGrey,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(children: [
        _BackgroundButton(this.icon, this.firstColor, this.secondColor),
        _ButtonContent(this.icon, this.text),
      ]),
    );
  }
}

class _BackgroundButton extends StatelessWidget {
  final IconData icon;
  final Color firstColor, secondColor;

  _BackgroundButton(
    this.icon,
    this.firstColor,
    this.secondColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _TranslucentIcon(this.icon),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            this.firstColor,
            this.secondColor,
          ])),
    );
  }
}

class _TranslucentIcon extends StatelessWidget {
  final IconData icon;

  _TranslucentIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Positioned(
              top: -40,
              right: -50,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.25),
              ))
        ],
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final IconData icon;
  final String text;

  _ButtonContent(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 140, width: 40),
        FaIcon(
          this.icon,
          size: 35,
          color: Colors.white,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.white,
        ),
        SizedBox(width: 40),
      ],
    );
  }
}
