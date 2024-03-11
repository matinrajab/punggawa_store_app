import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/search_product/search_product_page.dart';
import 'package:shoe_store_app/shared/theme.dart';

class FakeSearchProductTextField extends StatelessWidget {
  const FakeSearchProductTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SearchProductPage.routeName),
      child: Container(
        height: 48,
        margin: const EdgeInsets.all(pagePadding),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: generalBorderRadius,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: subtitleTextColor,
            ),
            Text(
              ' Search product',
              style: subtitleTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
