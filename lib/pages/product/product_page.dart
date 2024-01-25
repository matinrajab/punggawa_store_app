import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/product/widgets/product_familiar.dart';
import 'package:shoe_store_app/pages/product/widgets/product_page_header.dart';
import 'package:shoe_store_app/pages/product/widgets/product_price.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> _images = [
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
  ];

  final List<String> _familiarShoes = [
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
  ];

  int _currentIndex = 0;
  bool _isWishlist = false;

  void showSnackBar(context, String message) {
    final snackBar = SnackBar(
      backgroundColor: _isWishlist ? secondaryColor : alertColor,
      elevation: 0,
      duration: const Duration(milliseconds: 1000),
      content: Text(
        message,
        style: primaryTextStyle.copyWith(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget indicator(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: _currentIndex == index ? primaryColor : Color(0xffc4c4c4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 4,
      width: _currentIndex == index ? 16 : 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    int _index = -1;

    return Scaffold(
      backgroundColor: productBackgroundColor,
      body: ListView(
        children: [
          ProductPageHeader(),
          CarouselSlider(
            items: _images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _images.map((_) {
              _index++;
              return indicator(_index);
            }).toList(),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(pagePadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Header(
                              title: 'Adidas Sport',
                              subtitle: 'Hiking',
                              titleFontSize: 18,
                              subtitleFontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isWishlist = !_isWishlist;
                                showSnackBar(
                                  context,
                                  _isWishlist
                                      ? 'Has Been added to Wishlist'
                                      : 'Has been removed from the Wishlist',
                                );
                              });
                            },
                            child: Image.asset(
                              _isWishlist
                                  ? 'assets/button/button_wishlist_blue.png'
                                  : 'assets/button/button_wishlist.png',
                              height: 46,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProductPrice(price: 666),
                      SizedBox(
                        height: 30,
                      ),
                      Header(
                        title: 'Description',
                        subtitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean eget tellus quis neque rhoncus dignissim. Aenean',
                        titleFontSize: 14,
                        titleFontWeight: medium,
                        subtitleFontWeight: light,
                        space: 12,
                      ),
                    ],
                  ),
                ),
                ProductFamiliar(familiarShoes: _familiarShoes),
                Padding(
                  padding: const EdgeInsets.all(pagePadding),
                  child: Row(
                    children: [
                      IconBoxButton(
                        imageAsset: 'assets/icon/icon_chat_primary.png',
                        imageWidth: 23,
                        onTap: () {},
                        size: 54,
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: MyButton(
                          text: 'Add to Cart',
                          height: 54,
                          fontWeight: semiBold,
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: backgroundColor3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.all(30),
                              content: SingleChildScrollView(
                                child: Stack(
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: primaryTextColor,
                                      ),
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/icon/icon_success.png',
                                            width: 100,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: Text(
                                              'Hurray :)',
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 18,
                                                fontWeight: semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Item added successfully',
                                            style: secondaryTextStyle,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MyButton(
                                            text: 'View My Cart',
                                            onTap: () =>
                                                Navigator.popAndPushNamed(
                                                    context, cartPage),
                                            height: 44,
                                            width: 154,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
