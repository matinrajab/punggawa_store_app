import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ButtonWithPrefix extends StatelessWidget {
  final Color? fontColor;
  final Color? buttonColor;
  final Color borderColor;
  final Widget widget;
  final String text;
  final GestureTapCallback? onTap;

  const ButtonWithPrefix({
    super.key,
    this.fontColor,
    this.buttonColor = Colors.transparent,
    this.borderColor = primaryColor,
    required this.widget,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                      color: fontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
