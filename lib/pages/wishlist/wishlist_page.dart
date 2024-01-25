import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/wishlist/widgets/wishlist_tile.dart';
import 'package:shoe_store_app/theme/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  final bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(text: 'Favorite Shoes'),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: _isEmpty
                ? EmptyItem(
                    iconAsset: 'assets/icon/icon_empty_wishlist.png',
                    title: 'You don\'t have dream shoes?',
                    subtitle: 'Let\'s find your favorite shoes',
                  )
                : ListView(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: pagePadding),
                  children: [
                    WishlistTile(
                      imageAsset: 'assets/image/image_shoe.png',
                      productName: 'productName',
                      price: 666,
                    ),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}
