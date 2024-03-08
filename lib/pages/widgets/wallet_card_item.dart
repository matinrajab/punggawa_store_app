import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class WalletCardItem extends StatelessWidget {
  final String title;
  final String information;
  final double? informationFontSize;

  const WalletCardItem({
    super.key,
    required this.title,
    required this.information,
    this.informationFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontWeight: light,
          ),
        ),
        Text(
          information,
          style: primaryTextStyle.copyWith(
            fontSize: informationFontSize,
            fontWeight: medium,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
