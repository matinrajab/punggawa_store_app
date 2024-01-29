import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EmptyItem extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final String textOnButton;
  final double widthButton;

  const EmptyItem({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    this.widthButton = 152,
    this.textOnButton = 'Explore Store',
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
          padding: const EdgeInsets.only(
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
        SizedBox(
          width: MediaQuery.of(context).size.width - (2 * pagePadding),
          child: Text(
            subtitle,
            style: secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          text: textOnButton,
          onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, mainPage, (route) => false),
          width: widthButton,
          height: 44,
        ),
      ],
    );
  }
}
