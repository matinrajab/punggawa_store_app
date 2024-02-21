import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CartBottomNavBar extends StatelessWidget {
  final double price;
  const CartBottomNavBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: backgroundColor3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
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
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: generalBorderRadius,
                color: primaryColor,
              ),
              child: Material(
                borderRadius: generalBorderRadius,
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: generalBorderRadius,
                  onTap: () => Navigator.pushNamed(context, CheckoutPage.routeName),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Continue to Checkout',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
