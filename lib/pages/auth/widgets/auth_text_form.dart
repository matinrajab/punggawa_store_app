import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/auth/widgets/my_text_form_field.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AuthTextForm extends StatelessWidget {
  final String fieldName;
  final TextEditingController controller;
  final bool obscureText;
  final String prefixIconAsset;
  final String hintText;

  const AuthTextForm({
    super.key,
    required this.fieldName,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    required this.prefixIconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        MyTextFormField(
          controller: controller,
          obscureText: obscureText,
          hintText: hintText,
          prefixIconAsset: prefixIconAsset,
        ),
      ],
    );
  }
}
