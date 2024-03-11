import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/home/widgets/product_tile.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SearchProductPage extends StatelessWidget {
  static const routeName = 'search-product';

  SearchProductPage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    List<ProductModel> products = productProvider.products;

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
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        productProvider.suggestions = [];
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
                        controller: searchController,
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
              ),
              Expanded(
                child: Consumer<ProductProvider>(
                  builder: (context, productProvider, _) {
                    List<ProductModel> suggestions =
                        productProvider.suggestions;
                    return ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: pagePadding),
                      itemCount: suggestions.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ProductTile(
                          product: suggestions[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
