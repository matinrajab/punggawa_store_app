import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/wishlist/widgets/wishlist_tile.dart';
import 'package:shoe_store_app/providers/wishlist_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyAppBar(text: 'Favorite Shoes'),
        Expanded(
          child: Consumer<WishlistProvider>(
            builder: (context, wishlistProvider, _) {
              List<ProductModel> wishlist = wishlistProvider.wishlist;
              return Container(
                width: double.infinity,
                color: backgroundColor3,
                child: wishlist.isEmpty
                    ? const EmptyItem(
                        iconAsset: 'assets/icon/icon_empty_wishlist.png',
                        title: 'You don\'t have dream shoes?',
                        subtitle: 'Let\'s find your favorite shoes',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: pagePadding,
                        ),
                        itemCount: wishlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return WishlistTile(
                            product: wishlist[index],
                          );
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
