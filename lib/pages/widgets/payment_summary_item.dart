import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class PaymentSummaryItem extends StatelessWidget {
  final String type;
  final String information;

  const PaymentSummaryItem({
    super.key,
    required this.type,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: secondaryTextStyle.copyWith(fontSize: 12),
        ),
        Text(
          information == '\$0.0' ? 'Free' : information,
          style: primaryTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}
