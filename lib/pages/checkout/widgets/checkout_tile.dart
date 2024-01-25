import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutTile extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final double price;
  final int totalItem;

  const CheckoutTile({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
    required this.totalItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
            SizedBox(
              width: 30,
            ),
            Text('$totalItem Items', style: secondaryTextStyle.copyWith(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
