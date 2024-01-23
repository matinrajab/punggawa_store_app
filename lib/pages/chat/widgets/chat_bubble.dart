import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview_bubble.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;

  const ChatBubble({
    super.key,
    required this.text,
    this.isSender = false,
    this.hasProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: pagePadding),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (hasProduct)
            ProductPreviewBubble(
              imageAsset: 'assets/image/image_shoe.png',
              productName: 'productName',
              price: 666,
              isSender: isSender,
            ),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: isSender ? backgroundColor5 : backgroundColor4,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isSender ? generalRadius : 0),
                    topRight: Radius.circular(isSender ? 0 : generalRadius),
                    bottomLeft: Radius.circular(generalRadius),
                    bottomRight: Radius.circular(generalRadius),
                  ),
                ),
                child: Text(
                  text,
                  style: primaryTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
