import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/product/widgets/product_familiar.dart';
import 'package:shoe_store_app/pages/product/widgets/product_page_header.dart';
import 'package:shoe_store_app/pages/product/widgets/product_price.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/gallery_provider.dart';
import 'package:shoe_store_app/providers/wishlist_provider.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final List<String> _familiarShoes = [
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
  ];

  Widget indicator(int index, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: currentIndex == index ? primaryColor : const Color(0xffc4c4c4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 4,
      width: currentIndex == index ? 16 : 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    GalleryProvider galleryProvider =
        Provider.of<GalleryProvider>(context, listen: false);
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    galleryProvider.currentIndex = 0;

    return Scaffold(
      backgroundColor: productBackgroundColor,
      body: ListView(
        children: [
          const ProductPageHeader(),
          CarouselSlider(
            items: product.galleries!
                .map(
                  (image) => Image.network(
                    image.url!.substring(25),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                galleryProvider.currentIndex = index;
              },
            ),
          ),
          Consumer<GalleryProvider>(
            builder: (context, galleryProvider, _) {
              int index = -1;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: product.galleries!.map((_) {
                  index++;
                  return indicator(index, galleryProvider.currentIndex);
                }).toList(),
              );
            },
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            decoration: const BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(pagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Header(
                              title: product.name!,
                              subtitle: product.category!.name!,
                              titleFontSize: 18,
                              subtitleFontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              wishlistProvider.setProduct(product);
                              MySnackBar.showSnackBar(
                                context: context,
                                message:
                                    wishlistProvider.wishlist.contains(product)
                                        ? 'Has Been added to Wishlist'
                                        : 'Has been removed from the Wishlist',
                                isSuccess:
                                    wishlistProvider.wishlist.contains(product),
                              );
                            },
                            child: Consumer<WishlistProvider>(
                              builder: (context, wishlistProvider, _) =>
                                  Image.asset(
                                wishlistProvider.wishlist.contains(product)
                                    ? 'assets/button/button_wishlist_blue.png'
                                    : 'assets/button/button_wishlist.png',
                                height: 46,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProductPrice(price: product.price),
                      const SizedBox(
                        height: 30,
                      ),
                      Header(
                        title: 'Description',
                        subtitle: product.description!,
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
                        onTap: () => Navigator.pushNamed(
                          context,
                          detailChatPage,
                          arguments: product,
                        ),
                        size: 54,
                        color: Colors.transparent,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: MyButton(
                          text: 'Add to Cart',
                          height: 54,
                          fontWeight: semiBold,
                          onTap: () {
                            cartProvider.addCart(product);
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: backgroundColor3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: const EdgeInsets.all(30),
                                content: SingleChildScrollView(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 12,
                                              ),
                                              child: Text(
                                                'Hurray :)',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: semiBold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Item added successfully',
                                              style: secondaryTextStyle,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            MyButton(
                                              text: 'View My Cart',
                                              onTap: () =>
                                                  Navigator.popAndPushNamed(
                                                context,
                                                cartPage,
                                              ),
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
                            );
                          },
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
