import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/logout_button.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/image/profile.png',
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
                  titleColor: whiteColor,
                  subtitle: '@${authProvider.user.username}',
                  subtitleFontSize: 16,
                ),
              ),
            ),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
