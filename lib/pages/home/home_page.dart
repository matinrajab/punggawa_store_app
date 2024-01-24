import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/home/widgets/product_tile.dart';
import 'package:shoe_store_app/pages/home/widgets/product_card.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _category = [
    'All Shoes',
    'Running',
    'Training',
    'Basketball',
    'Hiking',
    'Sport',
  ];

  final List<ProductModel> _productList = [
    ProductModel(name: 'Adidas sport', price: 69.69, categoryId: 5),
    ProductModel(name: 'Adidas hiking', price: 69.69, categoryId: 4),
    ProductModel(name: 'Adidas basket', price: 69.69, categoryId: 3),
    ProductModel(name: 'Adidas training', price: 69.69, categoryId: 2),
    ProductModel(name: 'Adidas running', price: 69.69, categoryId: 1),
    ProductModel(name: 'Nike sport', price: 69.69, categoryId: 5),
    ProductModel(name: 'Nike hiking', price: 69.69, categoryId: 4),
    ProductModel(name: 'Nike basket', price: 69.69, categoryId: 3),
    ProductModel(name: 'Nike training', price: 69.69, categoryId: 2),
    ProductModel(name: 'Nike running', price: 69.69, categoryId: 1),
  ];

  int _categorySelected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Row(
            children: [
              Expanded(
                child: Header(
                  title: 'Halo, User',
                  subtitle: '@username',
                  subtitleFontSize: 16,
                ),
              ),
              Image.asset(
                'assets/image/image_profile.png',
                height: 54,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            itemCount: _category.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MyButton(
                  text: _category[index],
                  onTap: () {
                    setState(() {
                      _categorySelected = index;
                    });
                  },
                  borderColor: index == _categorySelected
                      ? primaryColor
                      : const Color(0xff302F37),
                  buttonColor: index == _categorySelected
                      ? primaryColor
                      : Colors.transparent,
                  fontSize: 13,
                  fontWeight: index == _categorySelected ? medium : light,
                  fontColor: index == _categorySelected
                      ? primaryTextColor
                      : subtitleTextColor,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: pagePadding, top: pagePadding, bottom: 14),
          child: Text(
            _categorySelected == 0 ? 'Popular Products' : 'For You',
            style: primaryTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
        _categorySelected == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 278,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: _productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ProductModel product = _productList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: ProductCard(
                            category: _category[product.categoryId],
                            productName: product.name,
                            price: product.price,
                          ),
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
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: pagePadding),
          child: Column(
            children: _productList.map((product) {
              return (_categorySelected == 0 ||
                      _categorySelected == product.categoryId)
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: pagePadding),
                      child: ProductTile(
                        category: _category[product.categoryId],
                        productName: product.name,
                        price: product.price,
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    );
            }).toList(),
          ),
        )
      ],
    );
  }
}
