import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/message_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_tile.dart';
import 'package:shoe_store_app/pages/chat_admin/admin_detail_chat_page.dart';
import 'package:shoe_store_app/pages/widgets/logout_button.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/services/message_service.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AdminChatPage extends StatelessWidget {
  static const routeName = '/admin-chat';

  const AdminChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: const MyAppBar(
        text: 'Message Support',
        actions: [
          LogoutButton(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(pagePadding),
        color: backgroundColor1,
        child: ListView.builder(
          itemCount: authProvider.users.length,
          itemBuilder: (BuildContext context, int index) {
            UserModel user = authProvider.users[index];
            return index == 0
                ? const SizedBox()
                : StreamBuilder<List<MessageModel>>(
                    stream:
                        MessageService().getMessagesByUserId(userId: user.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ChatTile(
                          message: snapshot.data![snapshot.data!.length - 1],
                          onTap: () {
                            authProvider.userIndexSelected = index;
                            Navigator.pushNamed(
                              context,
                              AdminDetailChatPage.routeName,
                              arguments: UninitializedProductModel(),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
          },
        ),
      ),
    );
  }
}
