import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyAppBar extends StatelessWidget {
  final String text;

  const MyAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor1,
      title: Text(
        text,
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      centerTitle: true,
    );
  }
}
