import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? buttonColor;
  final Color borderColor;
  final String text;
  final GestureTapCallback? onTap;

  const MyButton({
    super.key,
    this.height = 50,
    this.width,
    this.fontSize = 16,
    this.fontWeight = medium,
    this.fontColor,
    this.buttonColor = primaryColor,
    this.borderColor = primaryColor,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: generalBorderRadius,
        color: buttonColor,
      ),
      child: Material(
        borderRadius: generalBorderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: generalBorderRadius,
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                text,
                style: primaryTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: fontColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
