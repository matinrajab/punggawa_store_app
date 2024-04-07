import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview_bubble.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isFromUser;
  final ProductModel? product;

  const ChatBubble({
    super.key,
    required this.text,
    this.isFromUser = false,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment:
            isFromUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          product is UninitializedProductModel
              ? const SizedBox()
              : ProductPreviewBubble(
                  product: product!,
                  isFromUser: isFromUser,
                ),
          Row(
            mainAxisAlignment:
                isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: isFromUser ? primaryColor : secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isFromUser ? generalRadius : 0),
                    topRight: Radius.circular(isFromUser ? 0 : generalRadius),
                    bottomLeft: const Radius.circular(generalRadius),
                    bottomRight: const Radius.circular(generalRadius),
                  ),
                ),
                child: Text(
                  text,
                  style: whiteTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
