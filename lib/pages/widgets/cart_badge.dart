import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:badges/badges.dart' as badges;

class CartBadge extends StatelessWidget {
  final Widget? child;

  const CartBadge({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        int totalProducts = cartProvider.carts.length;
        return badges.Badge(
          badgeContent: Text(
            '$totalProducts',
            style: whiteTextStyle,
          ),
          badgeStyle: const badges.BadgeStyle(
            padding: EdgeInsets.all(6),
            badgeColor: tertiaryColor,
            borderSide: BorderSide(
              color: whiteColor,
            ),
          ),
          showBadge: totalProducts > 0,
          child: child,
        );
      },
    );
  }
}
