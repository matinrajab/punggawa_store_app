import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/pages/widgets/address_card_content.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final GestureTapCallback? onTap;

  const AddressCard({
    super.key,
    required this.address,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: generalBorderRadius,
            color: backgroundColor2,
          ),
          child: AddressCardContent(address: address),
        ),
      ),
    );
  }
}
