import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPageFooter extends StatelessWidget {
  final ProductModel product;

  const ProductPageFooter({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return Container(
      color: primaryColor,
      padding:
          const EdgeInsets.fromLTRB(pagePadding, 0, pagePadding, pagePadding),
      child: Row(
        children: [
          IconBoxButton(
            imagePath: 'assets/icon/chat_primary.png',
            imageWidth: 23,
            onTap: () => Navigator.pushNamed(
              context,
              DetailChatPage.routeName,
              arguments: product,
            ),
            size: 54,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: MyButton(
              text: 'Add to Cart',
              height: 54,
              fontWeight: semiBold,
              borderColor: whiteColor,
              buttonColor: whiteColor,
              fontColor: tertiaryColor,
              onTap: () {
                cartProvider.addCart(product);
                Fluttertoast.showToast(
                  msg: "Added to cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
