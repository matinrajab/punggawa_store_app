import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyModalBottomSheetContent extends StatelessWidget {
  final ProductModel product;
  final GestureTapCallback? onAddTapped;
  final GestureTapCallback? onMinTapped;

  const MyModalBottomSheetContent({
    super.key,
    required this.product,
    required this.onAddTapped,
    required this.onMinTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                currencyFormat(product.price!),
                style: priceTextStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onAddTapped,
              child: Image.asset(
                'assets/button/add.png',
                width: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) => Text(
                  '${cartProvider.cartTemp.quantity}',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
              ),
            ),
            GestureDetector(
              onTap: onMinTapped,
              child: Image.asset(
                'assets/button/min_gray.png',
                width: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
