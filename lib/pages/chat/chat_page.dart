import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_tile.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  final bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(text: 'Message Support'),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: _isEmpty
                ? EmptyItem(
                    iconAsset: 'assets/icon/icon_empty_chat.png',
                    title: 'Opss no message yet?',
                    subtitle: 'You have never done a transaction',
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: pagePadding),
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: pagePadding),
                      children: [
                        ChatTile(
                          sender: 'Black People',
                          content: 'what the fuck are you doing nigga',
                          onTap: () =>
                              Navigator.pushNamed(context, detailChatPage),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
