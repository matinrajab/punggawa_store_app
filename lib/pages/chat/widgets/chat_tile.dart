import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/message_model.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;
  final GestureTapCallback? onTap;

  const ChatTile({
    super.key,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icon/icon_shop_logo.png',
                height: 54,
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
                        fontSize: 15,
                        fontWeight: regular,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      message.message!,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            color: Color(0xff2B2939),
          ),
        ],
      ),
    );
  }
}
