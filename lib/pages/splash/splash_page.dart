import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Image.asset(
          'assets/image/image_splash.png',
          width: 130,
        ),
      ),
    );
  }
}
