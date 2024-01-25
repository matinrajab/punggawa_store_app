import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_bottom_nav_bar.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_bubble.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview.dart';
import 'package:shoe_store_app/pages/chat/widgets/product_preview_bubble.dart';
import 'package:shoe_store_app/theme/theme.dart';

class DetailChatPage extends StatelessWidget {
  DetailChatPage({super.key});

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: primaryTextColor,),
        ),
        toolbarHeight: 70,
        title: Row(
          children: [
            Image.asset(
              'assets/icon/icon_shop_online.png',
              height: 50,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ChatBottomNavBar(
        controller: _inputController,
        onTap: () {},
        widget: ProductPreview(
          imageAsset: 'assets/image/image_shoe.png',
          productName: 'productName',
          price: 666,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: pagePadding),
        children: [
          ChatBubble(
            text: 'are you nigga?',
            isSender: true,
            hasProduct: true,
          ),
          ChatBubble(text: 'right brother',),
          ChatBubble(
            text: 'why are you black?',
            isSender: true,
          ),
          ChatBubble(text: 'because i\'m nigga', hasProduct: true,),
        ],
      ),
    );
  }
}
