import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<GestureTapCallback>? routes;

  const ProfileMenu({
    super.key,
    required this.title,
    required this.options,
    this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          for (int i = 0; i < options.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: routes?[i],
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        options[i],
                        style: secondaryTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Icon(
                      forwardIcon,
                      color: secondaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
