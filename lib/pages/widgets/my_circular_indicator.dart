import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyCircularIndicator {
  static Widget show() {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
