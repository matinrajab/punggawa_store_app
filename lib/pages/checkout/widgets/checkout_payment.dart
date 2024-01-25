import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment_item.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutPayment extends StatelessWidget {
  final int quantity;
  final double price;
  final double shipping;

  const CheckoutPayment({
    super.key,
    required this.quantity,
    required this.price,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
          SizedBox(
            height: 12,
          ),
          CheckoutPaymentItem(
              type: 'Product Quantity', information: '$quantity Items'),
          SizedBox(
            height: 13,
          ),
          CheckoutPaymentItem(type: 'Product Price', information: '\$$price'),
          SizedBox(
            height: 13,
          ),
          CheckoutPaymentItem(type: 'Shipping', information: '\$$shipping'),
          SizedBox(
            height: 11,
          ),
          Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
          SizedBox(
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
                '\$${price + shipping}',
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
