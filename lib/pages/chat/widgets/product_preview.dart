import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPreview extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final double price;

  const ProductPreview({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 225,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: generalBorderRadius,
        color: backgroundColor5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: generalBorderRadius,
            child: Image.asset(
              imageAsset,
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$$price',
                  style: priceTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button/button_close.png',
            height: 22,
          ),
        ],
      ),
    );
  }
}
