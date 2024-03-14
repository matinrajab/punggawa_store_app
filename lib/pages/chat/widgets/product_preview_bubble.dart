import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPreviewBubble extends StatelessWidget {
  final ProductModel product;
  final bool isSender;

  const ProductPreviewBubble({
    super.key,
    required this.product,
    this.isSender = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSender ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? generalRadius : 0),
          topRight: Radius.circular(isSender ? 0 : generalRadius),
          bottomLeft: const Radius.circular(generalRadius),
          bottomRight: const Radius.circular(generalRadius),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: generalBorderRadius,
                child: Image.network(
                  product.galleries![0].url!.substring(25),
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: whiteTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              MyButton(
                text: 'Add to Cart',
                onTap: () {},
                height: 40,
                borderColor: whiteColor,
                buttonColor: Colors.transparent,
              ),
              const SizedBox(
                width: 8,
              ),
              MyButton(
                text: 'Buy Now',
                onTap: () {},
                height: 40,
                borderColor: tertiaryColor,
                buttonColor: tertiaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
