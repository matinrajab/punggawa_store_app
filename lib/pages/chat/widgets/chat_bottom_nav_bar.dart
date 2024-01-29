import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_input.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview.dart';

class ChatBottomNavBar extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final bool hasProduct;

  const ChatBottomNavBar({
    super.key,
    required this.controller,
    required this.onTap,
    this.hasProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          hasProduct
              ? const ProductPreview(
                  imageAsset: 'assets/image/image_shoe.png',
                  productName: 'productName',
                  price: 666,
                )
              : const SizedBox(
                  height: 0,
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
