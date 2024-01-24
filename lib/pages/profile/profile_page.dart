import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_menu.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor1,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Row(
              children: [
                Image.asset(
                  'assets/image/image_profile.png',
                  height: 64,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Header(
                    title: 'Halo, User',
                    subtitle: '@username',
                    subtitleFontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, signInPage, (route) => false),
                  icon: Image.asset(
                    'assets/button/button_exit.png',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: Column(
                children: [
                  ProfileMenu(
                    title: 'Account',
                    options: ['Edit Profile', 'Your Order', 'Help'],
                    routes: [() => Navigator.pushNamed(context, editProfilePage), (){}, (){}],
                  ),
                  ProfileMenu(
                    title: 'General',
                    options: [
                      'Privacy & Policy',
                      'Term of Service',
                      'Rate App'
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
