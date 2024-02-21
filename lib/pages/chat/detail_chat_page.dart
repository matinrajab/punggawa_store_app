import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/message_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/uninitialized_product_model.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_bottom_nav_bar.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_bubble.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/services/message_service.dart';
import 'package:shoe_store_app/shared/theme.dart';

class DetailChatPage extends StatelessWidget {
  DetailChatPage({super.key});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        message: _messageController.text,
        product: productProvider.uninitializedProduct
            ? UninitializedProductModel()
            : product,
      );
      product = UninitializedProductModel();
      productProvider.uninitializedProduct = true;
      _messageController.clear();
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
        toolbarHeight: 70,
        title: Row(
          children: [
            Image.asset(
              'assets/icon/icon_shop_online.png',
              height: 50,
            ),
            const SizedBox(
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
      body: Stack(
        children: [
          StreamBuilder<List<MessageModel>>(
            stream: MessageService()
                .getMessagesByUserId(userId: authProvider.user.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: pagePadding),
                  children: [
                    Column(
                      children: snapshot.data!
                          .map(
                            (MessageModel message) => ChatBubble(
                              text: message.message!,
                              isSender: message.isFromUser!,
                              product: message.product,
                            ),
                          )
                          .toList(),
                    ),
                    Consumer<ProductProvider>(
                      builder: (context, productProvider, _) => SizedBox(
                        height: productProvider.uninitializedProduct ? 80 : 180,
                      ),
                    ),
                  ],
                );
              } else {
                return MyCircularIndicator.show();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatBottomNavBar(
              controller: _messageController,
              onTap: handleAddMessage,
              emptyProduct: product is UninitializedProductModel,
              product: product,
            ),
          )
        ],
      ),
    );
  }
}
