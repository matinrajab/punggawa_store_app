import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPageHeader extends StatelessWidget {
  const ProductPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: pagePadding,
        right: pagePadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              backIcon,
              color: backgroundColor1,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, CartPage.routeName),
            child: Image.asset(
              'assets/icon/icon_cart_action.png',
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
