import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/home/widgets/fake_search_product_text_field.dart';
import 'package:shoe_store_app/pages/widgets/product_category_filter.dart';
import 'package:shoe_store_app/pages/home/widgets/product_card.dart';
import 'package:shoe_store_app/pages/widgets/product_tile.dart';
import 'package:shoe_store_app/pages/widgets/wallet_card.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    ProductCategoryProvider categoryProvider =
        Provider.of<ProductCategoryProvider>(context, listen: false);

    List<ProductModel> products = productProvider.products;
    List<CategoryModel> categories = categoryProvider.categories;

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 30,
            ),
            child: Image.asset(
              'assets/image/header_logo.png',
              alignment: Alignment.centerLeft,
              height: 30,
            ),
          ),
          const FakeSearchProductTextField(),
          const ProductCategoryFilter(),
          const Padding(
            padding: EdgeInsets.all(pagePadding),
            child: WalletCard(),
          ),
          // SizedBox(
          //   height: 12,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: pagePadding, bottom: 14),
            child: Consumer<ProductCategoryProvider>(
              builder: (context, categoryProvider, _) => Text(
                categoryProvider.categorySelected == 0
                    ? 'Popular Products'
                    : 'For You',
                style: primaryTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          Consumer<ProductCategoryProvider>(
            builder: (context, categoryProvider, _) => categoryProvider
                        .categorySelected ==
                    0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 278,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ProductCard(product: products[index]),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: pagePadding,
                          top: pagePadding,
                          bottom: 14,
                        ),
                        child: Text(
                          'New Arrivals',
                          style: primaryTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: pagePadding),
            child: Consumer<ProductCategoryProvider>(
              builder: (context, categoryProvider, _) {
                return Column(
                  children: products.map(
                    (product) {
                      final int categorySelected =
                          categoryProvider.categorySelected;
                      return (categorySelected == 0 ||
                              categories[categorySelected].id ==
                                  product.category!.id!)
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(bottom: pagePadding),
                              child: ProductTile(product: product),
                            )
                          : const SizedBox();
                    },
                  ).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
