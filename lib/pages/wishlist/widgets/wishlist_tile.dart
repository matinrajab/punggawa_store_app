import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class WishlistTile extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final double price;

  const WishlistTile({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 84,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: generalBorderRadius,
          color: backgroundColor4,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: generalBorderRadius,
              child: Image.asset(
                imageAsset,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productName,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
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
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/button/button_wishlist_blue.png',
              height: 34,
            ),
          ],
        ),
      ),
    );
  }
}
