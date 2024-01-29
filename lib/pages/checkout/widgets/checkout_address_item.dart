import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutAddressItem extends StatelessWidget {
  final String imageAssets;
  final String address;
  final String information;

  const CheckoutAddressItem({
    super.key,
    required this.imageAssets,
    required this.address,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageAssets,
          height: 40,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                information,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
