import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/widgets/product_tile.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductSuggestions extends StatelessWidget {
  const ProductSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCategoryProvider>(
      builder: (context, categoryProvider, _) {
        final int categorySelected = categoryProvider.categorySelected;
        final CategoryModel category =
            categoryProvider.categories[categorySelected];
        return Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            List<ProductModel> suggestions = productProvider.suggestions;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: pagePadding,
              ),
              itemCount: suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                final ProductModel suggestion = suggestions[index];
                return (category.name == suggestion.category!.name ||
                        categorySelected == 0)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ProductTile(
                          product: suggestion,
                        ),
                      )
                    : const SizedBox();
              },
            );
          },
        );
      },
    );
  }
}
