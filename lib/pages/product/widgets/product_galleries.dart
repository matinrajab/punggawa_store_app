import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/providers/gallery_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductGalleries extends StatelessWidget {
  final ProductModel product;

  const ProductGalleries({
    super.key,
    required this.product,
  });

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
    GalleryProvider galleryProvider =
        Provider.of<GalleryProvider>(context, listen: false);

    galleryProvider.currentIndex = 0;

    return Column(
      children: [
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
        )
      ],
    );
  }
}
