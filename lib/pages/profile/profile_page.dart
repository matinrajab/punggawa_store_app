import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/profile/widgets/logout_alert_dialog.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_menu.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    onLogoutTapped() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const LogoutAlertDialog(),
      );
    }

    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor1,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/image/image_profile.png',
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, _) => TitleAndSubtitle(
                      title: 'Halo, ${authProvider.user.name}',
                      subtitle: '@${authProvider.user.username}',
                      subtitleFontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onLogoutTapped,
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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              children: [
                ProfileMenu(
                  title: 'Account',
                  options: const ['Edit Profile', 'Your Order', 'Help'],
                  routes: [
                    () => Navigator.pushNamed(context, editProfilePage),
                    () => Navigator.pushNamed(context, orderPage),
                    () {}
                  ],
                ),
                const ProfileMenu(
                  title: 'General',
                  options: ['Privacy & Policy', 'Term of Service', 'Rate App'],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
