import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address_item.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutAddress extends StatelessWidget {
  final String yourAddress;

  const CheckoutAddress({super.key, required this.yourAddress});

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
            'Address Detail',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          CheckoutAddressItem(
            imageAssets: 'assets/icon/icon_store_location.png',
            address: 'Store Location',
            information: 'Adidas Core',
          ),
          SizedBox(height: 30,),
          CheckoutAddressItem(
            imageAssets: 'assets/icon/icon_your_address.png',
            address: 'Your Address',
            information: yourAddress,
          ),
        ],
      ),
    );
  }
}
