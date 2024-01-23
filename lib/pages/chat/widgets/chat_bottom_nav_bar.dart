import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/widgets/chat_input.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ChatBottomNavBar extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final Widget widget;

  const ChatBottomNavBar({
    super.key,
    required this.controller,
    required this.onTap,
    this.widget = const SizedBox(height: 0,),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget,
          ChatInput(
            controller: controller,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
