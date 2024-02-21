import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address_item.dart';
import 'package:shoe_store_app/shared/theme.dart';

class OrderAddress extends StatelessWidget {
  final String shippingAddress;

  const OrderAddress({
    super.key,
    required this.shippingAddress,
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
            'Address Detail',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CheckoutAddressItem(
            imageAssets: 'assets/icon/icon_your_address.png',
            address: 'Shipping Address',
            information: shippingAddress,
          ),
        ],
      ),
    );
  }
}
