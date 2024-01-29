import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutTile extends StatelessWidget {
  final CartModel cart;

  const CheckoutTile({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel product = cart.product!;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: generalBorderRadius,
          color: backgroundColor4,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: generalBorderRadius,
              child: Image.network(
                product.galleries![0].url!.substring(25),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name!,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              '${cart.quantity} Items',
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
