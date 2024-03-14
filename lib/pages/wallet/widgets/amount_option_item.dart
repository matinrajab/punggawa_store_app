import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AmountOptionItem extends StatelessWidget {
  final String leading;
  final String trailing;
  final bool isSelected;
  final GestureTapCallback? onTap;

  const AmountOptionItem({
    super.key,
    required this.leading,
    required this.trailing,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? primaryColor : backgroundColor2,
        ),
        borderRadius: generalBorderRadius,
      ),
      child: Material(
        borderRadius: generalBorderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: generalBorderRadius,
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$leading ',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                  color: isSelected ? primaryColor : primaryTextColor,
                ),
              ),
              Text(
                trailing,
                style: primaryTextStyle.copyWith(
                  fontWeight: light,
                  color: isSelected ? primaryColor : primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
