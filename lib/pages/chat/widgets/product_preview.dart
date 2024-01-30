import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPreview extends StatelessWidget {
  final ProductModel product;

  const ProductPreview({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return Container(
      height: 75,
      width: 225,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: generalBorderRadius,
        color: backgroundColor5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: generalBorderRadius,
            child: Image.network(
              product.galleries![0].url!.substring(25),
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle,
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
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              productProvider.uninitializedProduct = true;
            },
            child: Image.asset(
              'assets/button/button_close.png',
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}
