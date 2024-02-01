import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/wishlist_provider.dart';

class WishlistButton extends StatelessWidget {
  final ProductModel product;

  const WishlistButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        wishlistProvider.setProduct(product);
        MySnackBar.showSnackBar(
          context: context,
          message: wishlistProvider.wishlist.contains(product)
              ? 'Has Been added to Wishlist'
              : 'Has been removed from the Wishlist',
          isSuccess: wishlistProvider.wishlist.contains(product),
        );
      },
      child: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, _) => Image.asset(
          wishlistProvider.wishlist.contains(product)
              ? 'assets/button/button_wishlist_blue.png'
              : 'assets/button/button_wishlist.png',
          height: 46,
        ),
      ),
    );
  }
}
