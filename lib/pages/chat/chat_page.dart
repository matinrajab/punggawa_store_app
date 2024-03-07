import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/message_model.dart';
import 'package:shoe_store_app/models/uninitialized_product_model.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_tile.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/services/message_service.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Column(
      children: [
        const MyAppBar(text: 'Message Support'),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: StreamBuilder<List<MessageModel>>(
              stream: MessageService()
                  .getMessagesByUserId(userId: authProvider.user.id),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView(
                    padding: const EdgeInsets.all(pagePadding),
                    children: [
                      ChatTile(
                        message: snapshot.data![snapshot.data!.length - 1],
                        onTap: () => Navigator.pushNamed(
                          context,
                          DetailChatPage.routeName,
                          arguments: UninitializedProductModel(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const EmptyItem(
                    iconAsset: 'assets/icon/empty_chat.png',
                    title: 'Opss no message yet?',
                    subtitle: 'You have never done a transaction',
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
