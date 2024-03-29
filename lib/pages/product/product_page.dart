import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/product/widgets/product_galleries.dart';
import 'package:shoe_store_app/pages/product/widgets/product_page_footer.dart';
import 'package:shoe_store_app/pages/product/widgets/product_page_header.dart';
import 'package:shoe_store_app/pages/product/widgets/product_price.dart';
import 'package:shoe_store_app/pages/product/widgets/wishlist_button.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/detail-product';

  final ProductModel product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productBackgroundColor,
      bottomNavigationBar: ProductPageFooter(product: product),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: productBackgroundColor,
                ),
              ),
              Expanded(
                child: Container(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          ListView(
            children: [
              const ProductPageHeader(),
              ProductGalleries(product: product),
              const SizedBox(
                height: 17,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
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
                                child: TitleAndSubtitle(
                                  title: product.name!,
                                  titleColor: whiteColor,
                                  subtitle: product.category!.name!,
                                  titleFontSize: 18,
                                  subtitleFontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              WishlistButton(product: product),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProductPrice(price: product.price),
                          const SizedBox(
                            height: 30,
                          ),
                          TitleAndSubtitle(
                            title: 'Description',
                            titleColor: whiteColor,
                            subtitle: product.description!,
                            titleFontSize: 14,
                            titleFontWeight: medium,
                            subtitleFontWeight: light,
                            space: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
