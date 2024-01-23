import 'package:flutter/material.dart';
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
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor4),
                borderRadius: generalBorderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor4),
                borderRadius: generalBorderRadius,
              ),
              filled: true,
              fillColor: backgroundColor4,
              hintText: 'Type Message...',
              hintStyle: subtitleTextStyle,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: generalBorderRadius,
            color: primaryColor,
          ),
          child: Material(
            borderRadius: generalBorderRadius,
            color: Colors.transparent,
            child: InkWell(
              borderRadius: generalBorderRadius,
              onTap: onTap,
              child: Center(
                child: Image.asset(
                  'assets/icon/icon_submit.png',
                  width: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
