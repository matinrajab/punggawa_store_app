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
        wishlistProvider.wishlist.contains(product)
            ? MySnackBar.success(
                context,
                message: 'Has Been added to Wishlist',
              )
            : MySnackBar.failed(
                context,
                message: 'Has been removed from the Wishlist',
              );
      },
      child: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, _) => Image.asset(
          wishlistProvider.wishlist.contains(product)
              ? 'assets/button/wishlist_blue.png'
              : 'assets/button/wishlist.png',
          height: 46,
        ),
      ),
    );
  }
}
