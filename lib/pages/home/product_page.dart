import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: pagePadding,
              right: pagePadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: backgroundColor1,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, cartPage),
                  child: Image.asset(
                    'assets/icon/icon_cart_action.png',
                    width: 20,
                  ),
                )
              ],
            ),
          ),
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
                          Image.asset('assets/button/button_wishlist.png'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: backgroundColor2,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price starts from',
                              style: primaryTextStyle,
                            ),
                            Text(
                              '\$666',
                              style: priceTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: pagePadding,
                        bottom: 12,
                      ),
                      child: Text(
                        'Familiar Shoes',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 54,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        scrollDirection: Axis.horizontal,
                        itemCount: _familiarShoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 54,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    _familiarShoes[index],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                          onTap: () {},
                          height: 54,
                          fontWeight: semiBold,
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
