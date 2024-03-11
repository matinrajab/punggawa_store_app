import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/search_product/widgets/product_suggestions.dart';
import 'package:shoe_store_app/pages/search_product/widgets/search_product_page_header.dart';
import 'package:shoe_store_app/pages/widgets/product_category_filter.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SearchProductPage extends StatelessWidget {
  static const routeName = 'search-product';

  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SearchProductPageHeader(),
                ),
                const ProductCategoryFilter(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Expanded(
              child: ProductSuggestions(),
            ),
          ],
        ),
      ),
    );
  }
}
