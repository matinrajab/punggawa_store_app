import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductTile extends StatelessWidget {
  final String category;
  final String productName;
  final double price;

  const ProductTile({
    super.key,
    required this.category,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(
                'assets/image/image_shoe.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: secondaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    productName,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$$price',
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
