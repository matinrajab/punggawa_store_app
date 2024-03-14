import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    required this.text,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        text,
        style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              onPressed: onLeadingPressed ?? () => Navigator.pop(context),
              icon: Icon(
                leadingIcon,
                color: whiteColor,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
