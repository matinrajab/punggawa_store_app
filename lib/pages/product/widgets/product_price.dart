import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPrice extends StatelessWidget {
  final dynamic price;

  const ProductPrice({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor1.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price starts from',
            style: primaryTextStyle.copyWith(color: primaryColor,),
          ),
          Text(
            currencyFormat(price),
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
