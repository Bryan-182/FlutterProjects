import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color colorOne;
  final Color colorTwo;

  IconHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.colorOne = Colors.grey,
    this.colorTwo = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _GradientHeader(colorOne: this.colorOne, colorTwo: this.colorTwo),
        _HeaderTranslucentIcon(),
        _HeaderText(
            title: this.title, subtitle: this.subtitle, icon: this.icon),
      ],
    );
  }
}

class _GradientHeader extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;

  _GradientHeader({required this.colorOne, required this.colorTwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.colorOne,
            this.colorTwo,
          ],
        ),
      ),
    );
  }
}

class _HeaderTranslucentIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -50,
        left: -50,
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 250,
          color: Colors.white.withOpacity(0.2),
        ));
  }
}

class _HeaderText extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  _HeaderText({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: double.infinity,
        ),
        Text(
          this.title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        Text(
          this.subtitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.7),
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20),
        FaIcon(
          this.icon,
          size: 75,
          color: Colors.white,
        )
      ],
    );
  }
}
