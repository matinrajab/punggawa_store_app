import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class MyBackIconButton extends StatelessWidget {
  const MyBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded),
      color: primaryTextColor,
      onPressed: () => Navigator.pop(context),
    );
  }
}
