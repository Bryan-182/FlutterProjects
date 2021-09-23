import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_detail_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ShoeDetailPage()),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: 5,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (fullScreen)
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              _ShoeImage(),
              if (!fullScreen) _ShoeSize(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 0,
            child: _Shadow(),
          ),
          Image(
            image: AssetImage(shoeModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizeShoeBox(7),
          _SizeShoeBox(7.5),
          _SizeShoeBox(8),
          _SizeShoeBox(8.5),
          _SizeShoeBox(9),
          _SizeShoeBox(9.5),
        ],
      ),
    );
  }
}

class _SizeShoeBox extends StatelessWidget {
  final double size;

  const _SizeShoeBox(this.size);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.size = this.size;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (shoeModel.size != size) ? Colors.white : Color(0xffF1a23A),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (size == shoeModel.size)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
            ]),
        child: Text(
          '${size.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color:
                  (size != shoeModel.size) ? Color(0xffEAA14E) : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
