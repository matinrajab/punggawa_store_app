import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String prefixIconAsset;
  final String hintText;

  const MyTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    required this.prefixIconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: primaryTextStyle,
      cursorColor: primaryTextColor,
      decoration: InputDecoration(
        prefixIcon: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            prefixIconAsset,
            width: 16,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor2),
          borderRadius: generalBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor2),
          borderRadius: generalBorderRadius,
        ),
        filled: true,
        fillColor: backgroundColor2,
        hintText: hintText,
        hintStyle: subtitleTextStyle,
      ),
    );
  }
}
