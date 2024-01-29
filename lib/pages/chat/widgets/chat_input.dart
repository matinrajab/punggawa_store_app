import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/icon_box_button.dart';
import 'package:shoe_store_app/theme/theme.dart';

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
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundColor4),
                borderRadius: generalBorderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundColor4),
                borderRadius: generalBorderRadius,
              ),
              filled: true,
              fillColor: backgroundColor4,
              hintText: 'Type Message...',
              hintStyle: subtitleTextStyle,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconBoxButton(
          imageAsset: 'assets/icon/icon_submit.png',
          imageWidth: 20,
          onTap: onTap,
        ),
      ],
    );
  }
}
