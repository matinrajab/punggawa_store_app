import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ChatTile extends StatelessWidget {
  final String sender;
  final String content;
  final GestureTapCallback? onTap;

  const ChatTile({
    super.key,
    required this.sender,
    required this.content,
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
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender,
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: regular,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      content,
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
          SizedBox(
            height: 12,
          ),
          Divider(
            color: Color(0xff2B2939),
          ),
        ],
      ),
    );
  }
}