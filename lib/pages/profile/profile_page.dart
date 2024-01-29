import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_menu.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel user = authProvider.user;
    
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
                  child: Image.network(
                    user.profilePhotoUrl!,
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Header(
                    title: 'Halo, ${user.name}',
                    subtitle: '@${user.username}',
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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              children: [
                ProfileMenu(
                  title: 'Account',
                  options: const ['Edit Profile', 'Your Order', 'Help'],
                  routes: [() => Navigator.pushNamed(context, editProfilePage), (){}, (){}],
                ),
                const ProfileMenu(
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
      ],
    );
  }
}
