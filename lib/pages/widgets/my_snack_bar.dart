import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class MySnackBar {
  static void showSnackBar({
    required context,
    required String message,
    required bool isSuccess,
  }) {
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? secondaryColor : alertColor,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: primaryTextStyle.copyWith(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
