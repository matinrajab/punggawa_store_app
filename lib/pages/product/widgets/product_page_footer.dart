import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/product/widgets/success_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

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

    return Padding(
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
                  builder: (BuildContext context) => const SuccessAlertDialog(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
