import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/button_buy.dart';

class AddToCartButton extends StatelessWidget {
  final double amount;

  AddToCartButton({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              '\$$amount',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            ButtonBuy(text: 'Add to cart'),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
