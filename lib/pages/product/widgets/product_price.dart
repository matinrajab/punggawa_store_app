import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPrice extends StatelessWidget {
  final double price;

  const ProductPrice({super.key, required this.price,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price starts from',
            style: primaryTextStyle,
          ),
          Text(
            '\$$price',
            style: priceTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
