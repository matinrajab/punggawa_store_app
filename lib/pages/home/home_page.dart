import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/home/widgets/product_tile.dart';
import 'package:shoe_store_app/pages/home/widgets/product_card.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/category_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    UserModel user = authProvider.user;
    List<ProductModel> products = productProvider.products;
    List<CategoryModel> categories = categoryProvider.categories;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Row(
            children: [
              Expanded(
                child: Header(
                  title: 'Halo, ${user.name}',
                  subtitle: '@${user.username}',
                  subtitleFontSize: 16,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.network(
                  user.profilePhotoUrl!,
                  height: 54,
                  width: 54,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, _) => MyButton(
                  text: categories[index].name,
                  onTap: () {
                    categoryProvider.categorySelected = index;
                  },
                  borderColor: index == categoryProvider.categorySelected
                      ? primaryColor
                      : const Color(0xff302F37),
                  buttonColor: index == categoryProvider.categorySelected
                      ? primaryColor
                      : Colors.transparent,
                  fontSize: 13,
                  fontWeight: index == categoryProvider.categorySelected
                      ? medium
                      : light,
                  fontColor: index == categoryProvider.categorySelected
                      ? primaryTextColor
                      : subtitleTextColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: pagePadding, top: pagePadding, bottom: 14),
          child: Consumer<CategoryProvider>(
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
        Consumer<CategoryProvider>(
          builder: (context, categoryProvider, _) =>
              categoryProvider.categorySelected == 0
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
          child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, _) => Column(
              children: products.map((product) {
                return (categoryProvider.categorySelected == 0 ||
                        categories[categoryProvider.categorySelected].id ==
                            product.category!.id!)
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: pagePadding),
                        child: ProductTile(product: product),
                      )
                    : const SizedBox();
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
