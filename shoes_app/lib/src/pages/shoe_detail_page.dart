import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Hero(
              tag: 'shoe_1',
              child: ShoeSizePreview(
                fullScreen: true,
              ),
            ),
            Positioned(
                top: 40,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    changeStatusDark();
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                )),
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _AmountBuyNow(),
                  _Colors(),
                  _ButtonsLikeCartSetting(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: ButtonBuy(
                text: 'Buy now',
                height: 40,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  child: _ColorButton(
                      Color(0xffC6D642), 4, 'assets/images/verde.png'),
                  left: 90),
              Positioned(
                  child: _ColorButton(
                      Color(0xffFFAD29), 3, 'assets/images/amarillo.png'),
                  left: 60),
              Positioned(
                  child: _ColorButton(
                      Color(0xff2099F1), 2, 'assets/images/azul.png'),
                  left: 30),
              _ColorButton(Color(0xff364D56), 1, 'assets/images/negro.png'),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ButtonBuy(
                text: 'More relateditems',
                height: 30,
                width: 170,
                color: Color(0xffFfC675)),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;

  _ColorButton(this.color, this.index, this.asset);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = asset;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _ButtonsLikeCartSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Buttons(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _Buttons(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _Buttons(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  final Icon icon;

  _Buttons({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}
