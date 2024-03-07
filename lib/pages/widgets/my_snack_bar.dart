import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MySnackBar {
  static void success(
    context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: secondaryColor,
    );
  }

  static void failed(
    context, {
    required String message,
  }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: alertColor,
    );
  }

  static void _showSnackBar(
    context, {
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: primaryTextStyle.copyWith(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
