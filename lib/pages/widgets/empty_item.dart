import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';

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
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);

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
          onTap: () {
            pageProvider.currentIndex = 0;
            Navigator.pushNamedAndRemoveUntil(
                context, mainPage, (route) => false);
          },
          width: widthButton,
          height: 44,
        ),
      ],
    );
  }
}
