import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CartTile extends StatelessWidget {
  final CartModel cart;

  const CartTile({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel product = cart.product!;
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: generalBorderRadius,
          color: backgroundColor4,
        ),
        child: Column(
          children: [
            Row(
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
                      onTap: () => cartProvider.addQuantity(cart),
                      child: Image.asset(
                        'assets/button/add.png',
                        width: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '${cart.quantity}',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cartProvider.minQuantity(cart),
                      child: Image.asset(
                        'assets/button/min.png',
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () => cartProvider.removeCart(cart),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon/trash.png',
                    width: 10,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Remove',
                    style: alertTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
