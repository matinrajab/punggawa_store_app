import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SearchProductPageHeader extends StatelessWidget {
  SearchProductPageHeader({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    ProductCategoryProvider categoryProvider =
        Provider.of<ProductCategoryProvider>(context, listen: false);
    List<ProductModel> products = productProvider.products;
    categoryProvider.categorySelected = 0;

    searchProduct(String query) {
      if (query.isEmpty) {
        productProvider.suggestions = [];
      } else {
        productProvider.suggestions = products.where((product) {
          final productName = product.name!.toLowerCase();
          final input = query.toLowerCase();

          return productName.contains(input);
        }).toList();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.pop(context);
        productProvider.suggestions = [];
        categoryProvider.categorySelected = 0;
      },
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              productProvider.suggestions = [];
              categoryProvider.categorySelected = 0;
            },
            child: const Icon(
              backIcon,
              color: primaryTextColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              controller: _searchController,
              onChanged: searchProduct,
              style: primaryTextStyle,
              cursorColor: primaryTextColor,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputBorder,
                focusedErrorBorder: outlineInputBorder,
                filled: true,
                fillColor: backgroundColor2,
                hintText: 'Search product',
                hintStyle: subtitleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
