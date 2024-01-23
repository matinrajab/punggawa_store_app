import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EmptyItem extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;

  const EmptyItem({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconAsset,
          width: 80,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 12,
          ),
          child: Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
        Text(
          subtitle,
          style: secondaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MyButton(
          text: 'Explore Store',
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, mainPage, (route) => false),
          width: 152,
          height: 44,
        ),
      ],
    );
  }
}
