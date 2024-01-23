import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      backgroundColor: secondaryColor,
      onPressed: onPressed,
      child: Image.asset(
        'assets/icon/icon_cart.png',
        width: 20,
      ),
    );
  }
}
