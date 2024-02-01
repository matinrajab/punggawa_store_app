import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? subtitleFontWeight;
  final double? space;

  const TitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 24,
    this.subtitleFontSize,
    this.titleFontWeight = semiBold,
    this.subtitleFontWeight,
    this.space = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: titleFontSize,
            fontWeight: titleFontWeight,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: space,),
        Text(
          subtitle,
          style: subtitleTextStyle.copyWith(
            fontSize: subtitleFontSize,
            fontWeight: subtitleFontWeight,
          ),
        ),
      ],
    );
  }
}
