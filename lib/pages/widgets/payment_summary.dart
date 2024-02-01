import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary_item.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class PaymentSummary extends StatelessWidget {
  final int quantity;
  final double productPrice;
  const PaymentSummary({
    super.key,
    required this.quantity,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        color: backgroundColor4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          PaymentSummaryItem(
              type: 'Product Quantity', information: '$quantity Items'),
          const SizedBox(
            height: 13,
          ),
          PaymentSummaryItem(
            type: 'Product Price',
            information: '\$$productPrice',
          ),
          const SizedBox(
            height: 13,
          ),
          const PaymentSummaryItem(
            type: 'Shipping',
            information: '\$0.0',
          ),
          const SizedBox(
            height: 11,
          ),
          const Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                '\$$productPrice',
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
