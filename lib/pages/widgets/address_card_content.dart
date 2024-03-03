import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AddressCardContent extends StatelessWidget {
  final AddressModel address;

  const AddressCardContent({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address.name!,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '${address.phone}',
          style: secondaryTextStyle.copyWith(
            fontWeight: medium,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '${address.detail} ${address.additional == null ? '' : '(${address.additional})'}',
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Text(
          '${address.district!.name}, ${address.city!.name}, ${address.province!.name}, ID ${address.postalCode!.name}',
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
