import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment_item.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

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
          CheckoutPaymentItem(
              type: 'Product Quantity', information: '${cartProvider.totalItems()} Items'),
          const SizedBox(
            height: 13,
          ),
          CheckoutPaymentItem(type: 'Product Price', information: '\$${cartProvider.totalPrice()}'),
          const SizedBox(
            height: 13,
          ),
          const CheckoutPaymentItem(type: 'Shipping', information: '\$0.0'),
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
                '\$${cartProvider.totalPrice()}',
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
