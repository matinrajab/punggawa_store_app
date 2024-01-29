import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/wishlist_provider.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class WishlistTile extends StatelessWidget {
  final ProductModel product;

  const WishlistTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          productPage,
          arguments: product,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: generalBorderRadius,
            color: backgroundColor4,
          ),
          child: Row(
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
                      style: priceTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  wishlistProvider.setProduct(product);
                },
                child: Image.asset(
                  'assets/button/button_wishlist_blue.png',
                  height: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
