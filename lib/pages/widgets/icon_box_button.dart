import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class IconBoxButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final String imagePath;
  final double? imageWidth;
  final GestureTapCallback? onTap;

  const IconBoxButton({
    super.key,
    this.size = 50,
    this.color = backgroundColor1,
    required this.imagePath,
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
              imagePath,
              width: imageWidth,
            ),
          ),
        ),
      ),
    );
  }
}
