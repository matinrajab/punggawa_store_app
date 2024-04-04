import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary_item.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class PaymentSummary extends StatelessWidget {
  final int quantity;
  final int productPrice;
  final int shippingPrice;

  const PaymentSummary({
    super.key,
    required this.quantity,
    required this.productPrice,
    required this.shippingPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        color: backgroundColor2,
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
            information: currencyFormat(productPrice),
          ),
          const SizedBox(
            height: 13,
          ),
          PaymentSummaryItem(
            type: 'Shipping',
            information: currencyFormat(shippingPrice),
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
                currencyFormat(productPrice + shippingPrice),
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
