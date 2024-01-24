import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EditProfileTextForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const EditProfileTextForm({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        TextField(
          controller: controller,
          style: primaryTextStyle.copyWith(fontSize: 16),
          cursorColor: primaryTextColor,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: subtitleTextColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: subtitleTextColor),
            ),
          ),
        ),
      ],
    );
  }
}
