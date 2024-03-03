import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? textValidator;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.textValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: textValidator == null
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return textValidator;
              }
              return null;
            },
      style: primaryTextStyle.copyWith(fontSize: 14),
      cursorColor: primaryTextColor,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: secondaryTextColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: primaryTextColor),
        ),
        hintText: hintText,
        hintStyle: secondaryTextStyle,
      ),
    );
  }
}
