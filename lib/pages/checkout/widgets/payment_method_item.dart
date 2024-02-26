import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class PaymentMethodItem extends StatelessWidget {
  final String paymentMethod;
  final bool isSelected;

  const PaymentMethodItem({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              paymentMethod,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
          isSelected
              ? Icon(
                  Icons.check,
                  color: primaryColor,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
