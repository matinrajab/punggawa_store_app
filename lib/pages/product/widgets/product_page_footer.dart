import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
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
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);

    return Container(
      color: primaryColor,
      padding:
          const EdgeInsets.fromLTRB(pagePadding, 0, pagePadding, pagePadding),
      child: Row(
        children: [
          IconBoxButton(
            imagePath: 'assets/icon/chat_primary.png',
            imageWidth: 24,
            onTap: () => Navigator.pushNamed(
              context,
              DetailChatPage.routeName,
              arguments: product,
            ),
            size: 54,
          ),
          const SizedBox(
            width: 8,
          ),
          IconBoxButton(
            imagePath: 'assets/icon/cart_add.png',
            imageWidth: 24,
            onTap: () {
              cartProvider.addCart(product);
              Fluttertoast.showToast(
                msg: "Added to cart",
              );
            },
            size: 54,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: MyButton(
              text: 'Buy Now',
              height: 54,
              fontWeight: semiBold,
              borderColor: tertiaryColor,
              buttonColor: tertiaryColor,
              fontColor: whiteColor,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
