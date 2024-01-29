import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPreviewBubble extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final double price;
  final bool isSender;

  const ProductPreviewBubble({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
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
        color: isSender ? backgroundColor5 : backgroundColor4,
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
                child: Image.asset(
                  imageAsset,
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
                      productName,
                      style: primaryTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$$price',
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
                buttonColor: backgroundColor5,
                fontColor: primaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              MyButton(
                text: 'Buy Now',
                onTap: () {},
                height: 40,
                buttonColor: primaryColor,
                fontColor: blackTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
