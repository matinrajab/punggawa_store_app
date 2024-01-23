import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? subtitleFontSize;

  const Header({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitleFontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: subtitleTextStyle.copyWith(
            fontSize: subtitleFontSize,
            fontWeight: regular,
          ),
        ),
      ],
    );
  }
}
