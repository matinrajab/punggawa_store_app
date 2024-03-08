import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController? controller;
  final GestureTapCallback? onTap;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            minLines: 1,
            maxLines: 5,
            controller: controller,
            style: primaryTextStyle,
            cursorColor: primaryTextColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              filled: true,
              fillColor: backgroundColor2,
              hintText: 'Type Message...',
              hintStyle: subtitleTextStyle,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconBoxButton(
          imageAsset: 'assets/icon/submit.png',
          imageWidth: 20,
          onTap: onTap,
        ),
      ],
    );
  }
}
