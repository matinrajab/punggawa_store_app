import 'package:flutter/material.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String productName;
  final double price;

  const ProductCard({
    super.key,
    required this.category,
    required this.productName,
    required this.price,
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
          onTap: () => Navigator.pushNamed(context, productPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: 120,
                  width: 215,
                  child: Image.asset(
                    'assets/image/image_shoe.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        productName,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$$price',
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
