import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278,
      width: 215,
      decoration: BoxDecoration(
        color: productBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.network(
                  product.galleries![0].url!.substring(25),
                  fit: BoxFit.cover,
                  height: 120,
                  width: 215,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category!.name!,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        product.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
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
