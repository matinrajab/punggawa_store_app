import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor1,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  'assets/image/image_profile.png',
                  height: 64,
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Header(
                    title: 'Halo, User',
                    subtitle: '@username',
                    subtitleFontSize: 16,
                  ),
                ),
                Image.asset('assets/button/button_exit.png', height: 20,),
              ],
            ),
          ),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
          ),
        ),
      ],
    );
  }
}
