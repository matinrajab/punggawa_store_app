import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class IconBoxButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final String imageAsset;
  final double? imageWidth;
  final GestureTapCallback? onTap;

  const IconBoxButton({
    super.key,
    this.size = 50,
    this.color = primaryColor,
    required this.imageAsset,
    required this.imageWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        border: Border.all(color: primaryColor),
        color: color,
      ),
      child: Material(
        borderRadius: generalBorderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: generalBorderRadius,
          onTap: onTap,
          child: Center(
            child: Image.asset(
              imageAsset,
              width: imageWidth,
            ),
          ),
        ),
      ),
    );
  }
}
