import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_input.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChatBottomNavBar extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final bool emptyProduct;
  final ProductModel? product;

  const ChatBottomNavBar({
    super.key,
    required this.controller,
    required this.onTap,
    required this.emptyProduct,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.uninitializedProduct = emptyProduct;

    return Container(
      color: backgroundColor3,
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<ProductProvider>(
            builder: (context, productProvider, _) =>
                productProvider.uninitializedProduct
                    ? const SizedBox()
                    : ProductPreview(product: product!),
          ),
          ChatInput(
            controller: controller,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
