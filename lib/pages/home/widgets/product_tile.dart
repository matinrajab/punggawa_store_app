import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pushNamed(
            context,
            productPage,
            arguments: product,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.network(
                    product.galleries![0].url!.substring(25),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category!.name!,
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        product.name!,
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
